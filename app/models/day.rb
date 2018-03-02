class Day < ApplicationRecord

  has_many :expenses, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_one :post, dependent: :destroy
  has_one :accommodation, dependent: :destroy
  has_many :day_locations
  has_many :locations, through: :day_locations

  validates :number, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

  def total_expense
    TotalExpense.calculate days: [number]
  end

end
