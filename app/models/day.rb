class Day < ApplicationRecord

  has_many :expenses

  validates :number, presence: true, numericality: { greater_than: 0 }

  def total_expense(category: Expense::Category::COMBINED)
    total = Expense.new day: self, category: category
    total.amount = 0

    relevate_expenses(category).each do |expense|
      total.amount += expense.amount
      total.currency_code = combine_currency_codes total.currency_code, expense.currency_code
    end

    total.currency_code ||= Currency::DEFAULT.code
    total
  end

private

  def relevate_expenses(category)
    if category == Expense::Category::COMBINED
      expenses
    else
      expenses.where(category: category)
    end
  end

  def combine_currency_codes(*codes)
    unique_codes = codes.compact.uniq
    unique_codes.size == 1 ? unique_codes.first : Currency::DEFAULT.code
  end

end
