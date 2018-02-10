class Area < ApplicationRecord

  validates :name, :country_id, presence: true

  belongs_to :country
  has_many :locations

end
