class Blog < ActiveRecord::Base
  translates :title, :content
  globalize_accessors
  belongs_to :user
  validates :title, :content, :user, presence: true
  

  def self.search(search)
    search_condition = "%" + search.downcase + "%"
    Blog.joins(:user)
    .where("lower(email) like ? or lower(title) like ? or lower(content) like ? ", search_condition, search_condition, search_condition) 
  end

  def date_created_human
    self.created_at.strftime("%e %B %Y %H:%M")
  end
    
  def date_updated_human
    self.updated_at.strftime("%e %B %Y %H:%M")
  end
end