class Gallery < ActiveRecord::Base
  include ApplicationHelper
  
  validates :title, :description, presence: true
  has_many :photos, as: :imageable, dependent: :destroy
end
