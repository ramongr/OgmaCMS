class Newsletter < ActiveRecord::Base
  translates :name, :subject, :body
  globalize_accessors
  
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  has_and_belongs_to_many :users

  validates_presence_of :name, :subject, :body, :created_by, :updated_by
end
