class Comment < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'
  belongs_to :post

  validates_presence_of :content, :created_by, :post
  before_validation :sanitize_content

  private

  def sanitize_content
    self.content = ActionController::Base.helpers.sanitize(self.content, tags: %w(p, sup, sub, s, u, em, strong, a, img))
  end
end
