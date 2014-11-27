class Newsletter < ActiveRecord::Base
  translates :name, :subject, :body
  globalize_accessors
  
  validates :name, :subject, :body, presence: true
  has_and_belongs_to_many :users
end
