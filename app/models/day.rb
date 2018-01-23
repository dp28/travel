class Day < ApplicationRecord

  has_many :expenses
  has_one :post

  validates :number, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

end
