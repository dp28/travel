# Not persisted, so doesn't inherit from Application model
class TotalExpense

  class Category

    COMBINED = 'COMBINED'.freeze

  end

  def self.calculate(days: nil, categories: nil)
    expenses = Expense.all
    day_count = days.try(:count) || Day.count
    expenses = expenses.joins(:day).where(days: { number: days }) if days
    expenses = expenses.where(category: categories) if categories
    TotalExpense.new expenses: expenses, day_count: day_count
  end

  attr_reader :expenses, :day_count

  def amount
    @amount ||= begin
      if all_expenses_have_same?(&:currency_code)
        expenses.sum(&:amount)
      else
        expenses.reduce(0) do |total, expense|
          total + expense.price.convert_to(currency).amount
        end
      end
    end
  end

  def category
    @category ||= if_same_for_all_expenses fallback_to: Category::COMBINED, &:category
  end

  def currency_code
    @currency_code ||= if_same_for_all_expenses fallback_to: Currency::DEFAULT.code, &:currency_code
  end

  def price
    @price ||= CurrencyAmount.new currency: currency, amount: amount
  end

  def average_price_per_day
    @average_price_per_day ||= CurrencyAmount.new currency: currency, amount: amount / day_count
  end

  def within_category(category)
    TotalExpense.new(
      expenses: expenses.select { |expense| expense.category == category },
      day_count: day_count
    )
  end

private

  def initialize(expenses: [], day_count: nil)
    @expenses = expenses
    @day_count = day_count || expenses.group_by(&:day).count
  end

  def if_same_for_all_expenses(fallback_to:, &get_property)
    if expenses.any? && all_expenses_have_same?(&get_property)
      yield expenses.first
    else
      fallback_to
    end
  end

  def currency
    @currency ||= Currency.find_by_code currency_code
  end

  def all_expenses_have_same?(&get_property)
    expenses.map(&get_property).uniq.size == 1
  end

end
