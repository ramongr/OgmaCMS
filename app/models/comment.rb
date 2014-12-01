class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :content, :user, :post, presence: true

  before_validation :sanitize_content

  private

  def sanitize_content
    self.content = ActionController::Base.helpers.sanitize(self.content, tags: %w(p, sup, sub, s, u, em, strong, a, img))
  end
end
