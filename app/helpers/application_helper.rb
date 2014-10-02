module ApplicationHelper
  def parseNewsletter(body, user: nil, email: nil, event: nil, resource: nil, token: nil)
    result = body

    if user
      result = result.gsub(/[*]user_name[*]/, user.name)
      .gsub(/[*]user_email[*]/, user.email)
    else
      if email
        result = result.gsub(/[*]name[*]/, email)
      end
    end

    if event
      result = result.gsub(/[*]event_title[*]/, event.title)
      .gsub(/[*]event_description[*]/, event.body)
    end

    if resource && token
      result = result.gsub(/[*]confirmation_link[*]/, (link_to 'Confirm my account', confirmation_url(resource, confirmation_token: token)))
    end

    result
  end

  def date_created_human
    created_at.strftime('%e %b %Y %H:%M')
  end

  def date_updated_human
    updated_at.strftime('%e %b %Y %H:%M')
  end

  def start_time_human
    start_time.strftime('%e %b %Y %H:%M')
  end

  def end_time_human
    end_time.strftime('%e %b %Y %H:%M')
  end

  def start_date_human
    start_time.strftime('%e %b %Y')
  end

  def end_date_human
    end_time.strftime('%e %b %Y')
  end

  def date_human
    date.strftime('%e %b %Y')
  end
end
