class Country < ApplicationRecord

  validates :name, :currency_code, presence: true

  has_many :areas
  has_many :locations, through: :areas
  has_many :days, through: :areas

  def total_expense
    TotalExpense.calculate days: day_numbers
  end

  def food_occurrences
    FoodOccurrences.new(day_numbers: day_numbers).occurrences
  end

private

  def day_numbers
    days.pluck(:number)
  end

end
