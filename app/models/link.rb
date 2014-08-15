class Link < ActiveRecord::Base
  validates :title, :value , presence: true
  has_and_belongs_to_many :sidebars

  SYSTEM_LINK = 0
  USER_LINK = 1
  OTHER_LINK = 2
  
  def url_with_protocol
  	(self.type_mask == SYSTEM_LINK) ? value :
    /^http/.match(value) ? value : "http://#{value}"
  end
end
