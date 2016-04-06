class Slider < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  has_many :photos, as: :imageable, dependent: :destroy

  validates_presence_of :title, :created_by, :updated_by

  def self.selected
    Slider.find_by selected: true
  end
end
