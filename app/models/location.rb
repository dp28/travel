class Location < ApplicationRecord

  class Type

    ACCOMMODATION = 'ACCOMMODATION'.freeze
    AIRPORT = 'AIRPORT'.freeze
    STATION = 'STATION'.freeze

    ALL = [
      ACCOMMODATION,
      AIRPORT,
      STATION
    ].freeze

  end

  validates :name, :latitude, :longitude, :type, :area_id, presence: true

  validates :type, inclusion: { in: Location::Type::ALL }

  belongs_to :area
  has_many :day_locations
  has_many :days, through: :day_locations

  self.inheritance_column = :unused

end
