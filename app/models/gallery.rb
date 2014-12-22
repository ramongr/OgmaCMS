class Gallery < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_many :photos, as: :imageable, dependent: :destroy

  validates_presence_of :title, :description, :created_by, :updated_by  
end
