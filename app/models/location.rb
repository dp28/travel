class Location < ApplicationRecord

  validates :place_name, :latitude, :longitude, :country_id, presence: true

  belongs_to :country
  has_many :day_locations
  has_many :days, through: :day_locations

end
