class PostRepository

  def search
    Post.all.order(created_at: :desc)
  end

  def store(post)
    post.save
    post
  end

  def find_by_id(id)
    Post.find_by(id: id)
  end

end
