class Country < ApplicationRecord

  validates :name, :currency_code, presence: true

end
