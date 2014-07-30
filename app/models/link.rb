class Link < ActiveRecord::Base
  has_and_belongs_to_many :sidebars


  def url_with_protocol
    /^http/.match(value) ? value : "http://#{value}"
  end
end
