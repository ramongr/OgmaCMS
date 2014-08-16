class VisitorComment < ActiveRecord::Base
  belongs_to :user
  validates :subject, :content, :user, presence: true
  validates_length_of :content, maximum: 340
end
