class Area < ApplicationRecord

  validates :name, :country_id, presence: true

  belongs_to :country
  has_many :locations
  has_many :accommodations, through: :locations
  has_many :days, through: :accommodations

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
