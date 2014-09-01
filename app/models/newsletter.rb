class Newsletter < ActiveRecord::Base
  validates :title, :body, presence: true
  has_and_belongs_to_many :users
end
