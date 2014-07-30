class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :content, :user, :post, presence: true

  def date_created_human
    self.created_at.strftime("%e %B %Y %H:%M")
  end
    
  def date_updated_human
    self.updated_at.strftime("%e %B %Y %H:%M")
  end
end