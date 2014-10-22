class Newsletter < ActiveRecord::Base
  translates :subject, :body
  globalize_accessors
  
  validates :title, :subject, :body, presence: true
  has_and_belongs_to_many :users
end
