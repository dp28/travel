class Day < ApplicationRecord

  has_many :expenses, dependent: :destroy
  has_one :post, dependent: :destroy

  validates :number, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true

end
