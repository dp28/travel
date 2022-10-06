class Expense < ApplicationRecord

  class Category

    FOOD = 'FOOD'.freeze
    ACCOMMODATION = 'ACCOMMODATION'.freeze
    LONG_DISTANCE_TRAVEL = 'LONG_DISTANCE_TRAVEL'.freeze
    SHORT_TRAVEL = 'SHORT_TRAVEL'.freeze
    ACTIVITIES = 'ACTIVITIES'.freeze
    OTHER = 'OTHER'.freeze

    ALL = [
      FOOD,
      ACCOMMODATION,
      LONG_DISTANCE_TRAVEL,
      SHORT_TRAVEL,
      ACTIVITIES,
      OTHER
    ].freeze

  end

  belongs_to :day

  validates :amount, :currency_code, :category, :day_id, presence: true
  validates :category, inclusion: { in: Category::ALL }
  validates :currency_code, inclusion: { in: Currency::ALL.map(&:code).map(&:to_s) }

  def price
    return @price if defined? @price
    currency = Currency.find_by_code currency_code
    @price = CurrencyAmount.new currency: currency, amount: amount
  end

end
