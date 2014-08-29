module ApplicationHelper

  def date_created_human
    self.created_at.strftime("%e %B %Y %H:%M")
  end
    
  def date_updated_human
    self.updated_at.strftime("%e %B %Y %H:%M")
  end
end
