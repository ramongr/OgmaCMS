class VisitorComment < ActiveRecord::Base
  include ApplicationHelper
  
  belongs_to :user
  validates :subject, :content, :user, presence: true
  validates_length_of :content, maximum: 340
end
