module ApplicationHelper

  def date_created_human
    self.created_at.strftime("%e %B %Y %H:%M")
  end
    
  def date_updated_human
    self.updated_at.strftime("%e %B %Y %H:%M")
  end

  def start_time_human
    self.start_time.strftime("%e %B %Y %H:%M")
  end
    
  def end_time_human
    self.end_time.strftime("%e %B %Y %H:%M")
  end
end
