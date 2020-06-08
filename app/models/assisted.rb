class Assisted < ApplicationRecord
  has_many :posts, dependent: :destroy

  def posts
    posts = []
    posts = Post.where(assisted_id: self.id)
    return posts
  end

end
