class Post < ApplicationRecord
  belongs_to :user
  belongs_to :assisted

  def formatted_date
    self.created_at.strftime('%d/%m/%Y às %H:%m')
  end
end
