class Slider < ActiveRecord::Base
  validates :title, presence: true
  has_many :photos, as: :imageable, dependent: :destroy
end
