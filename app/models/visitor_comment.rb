class VisitorComment < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'

  validates_presence_of :subject, :content, :created_by, :updated_by
  validates_length_of :content, maximum: 340
end
