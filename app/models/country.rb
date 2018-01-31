class Country < ApplicationRecord

  validates :name, :currency_code, presence: true

  has_many :locations

end
