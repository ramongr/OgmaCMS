module ApplicationHelper
  def parseNewsletter(body, user: nil, email: nil, event: nil, resource: nil, token: nil)
    result = body

    if(user)
      result = result.gsub(/[*]user_name[*]/,user.name)
                     .gsub(/[*]user_email[*]/,user.email)
    else
      if(email)
        result = result.gsub(/[*]name[*]/,email)
      end
    end

    if(event)
      result = result.gsub(/[*]event_title[*]/,event.title)
                     .gsub(/[*]event_description[*]/,event.body)
    end
    
    if(resource and token)
      result = result.gsub(/[*]confirmation_link[*]/,(link_to 'Confirm my account', confirmation_url(resource, confirmation_token: token)))
    end

    result
  end

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
