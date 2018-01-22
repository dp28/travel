class Day < ApplicationRecord

  has_many :expenses

  validates :number, presence: true, numericality: { greater_than: 0 }

end
