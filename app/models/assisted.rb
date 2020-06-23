class Assisted < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates_presence_of :name, :gender, :address, :name_mother, :name_father, :cpf, :phone1, :email, presence: { message: 'Campo deve ser preenchido' }
  def posts
    posts = []
    posts = Post.where(assisted_id: self.id)
    return posts
  end

end
