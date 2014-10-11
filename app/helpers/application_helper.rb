module ApplicationHelper
  def parseEmail(content, user: nil, email: nil, event: nil, resource: nil, token: nil)
    result = content

    if user
      result = result.gsub(/[*]user_name[*]/, user.name)
      .gsub(/[*]user_email[*]/, user.email)
    else
      if email
        result = result.gsub(/[*]name[*]/, email)
      end
    end

    if event
      result = result.gsub(/[*]event_name[*]/, event.title)
      .gsub(/[*]event_description[*]/, event.body)
    end

    if resource && token
      result = result.gsub(/[*]confirmation_link[*]/, (link_to 'Confirm my account', confirmation_url(resource, confirmation_token: token)))
    end

    result = result.gsub(/[*]site_name[*]/, Setting.site_name)

    result
  end
end
