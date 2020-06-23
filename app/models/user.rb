class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def username
    self.email.split('@')[0].capitalize
  end

  def posts
    posts = []
    posts = Post.where(user_id: self.id)
    return posts
  end

end
