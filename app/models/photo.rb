class Photo < ApplicationRecord

  validates :url, :day_id, :width, :height, presence: true

  belongs_to :day

  def aspect_ratio
    width.to_f / height.to_f
  end

end
