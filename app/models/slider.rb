class Slider < ActiveRecord::Base
  validates :title, presence: true
  has_many :photos, as: :imageable, dependent: :destroy

  def self.selected
    Slider.find_by selected: true
  end

end
