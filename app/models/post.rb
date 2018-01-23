class Post < ApplicationRecord

  validates :content, :written_at, presence: true

  def published_at
    created_at
  end

end
