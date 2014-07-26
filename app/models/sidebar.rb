class Sidebar < ActiveRecord::Base

  has_and_belongs_to_many :links
  has_and_belongs_to_many :static_pages
  
  validates :title, :type_mask, presence: true
  
  # only in last version of rails
  #enum type_mask: { left: 0, right: 1, top: 2, bottom: 3 }

  LEFT = 0
  RIGHT = 1
  TOP = 2
  BOTTOM = 3

  TYPES = {
  	LEFT      => 'LEFT',
    RIGHT     => 'RIGHT',
    TOP       => 'TOP',
    BOTTOM    => 'BOTTOM',
  }

  validates_inclusion_of :type_mask, :in => TYPES.keys,
      :message => "{{value}} must be in #{TYPES.values.join ','}"

  # just a helper method for the view
  def type_mask_name
    TYPES[type_mask]
  end

  
end
