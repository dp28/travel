class Country < ApplicationRecord

  validates :name, :currency_code, presence: true

  has_many :areas
  has_many :locations, through: :areas
  has_many :days, through: :locations

  def total_expense
    TotalExpense.calculate days: days.pluck(:number)
  end
end
