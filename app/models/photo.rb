class Photo < ApplicationRecord

  validates :url, :day_id, presence: true

  belongs_to :day

end
