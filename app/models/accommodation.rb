class Accommodation < ApplicationRecord

  belongs_to :day
  belongs_to :location

end
