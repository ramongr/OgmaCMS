class Newsletter < ActiveRecord::Base
  validates :title, :subject, :body, presence: true
  has_and_belongs_to_many :users
end
