class Gallery < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :photos
end
