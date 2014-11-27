class Comment < ActiveRecord::Base
  include CommentsHelper
  belongs_to :user
  belongs_to :post
  validates :content, :user, :post, presence: true

  before_validation :sanitize_content

  private

  def sanitize_content
    sanitizeComment(self.content)
  end
end
