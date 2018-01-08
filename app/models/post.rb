class Post < ApplicationRecord

  validates :title, :content, presence: true

  def published_at
    created_at
  end

end
