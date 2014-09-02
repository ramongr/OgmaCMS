class Photo < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :attachment

  validates :position, presence: true
end
