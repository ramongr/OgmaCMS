class VisitorComment < ActiveRecord::Base
  validates :subject, :name, :email, :content, presence: true
  validates_format_of :email, with: /@/
  validates_length_of :content, maximum: 340
end
