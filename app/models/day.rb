class Day < ApplicationRecord

  validates :number, presence: true, numericality: { greater_than: 0 }

end
