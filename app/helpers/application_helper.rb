module ApplicationHelper
  def parseEmail(content, user: nil, event: nil, token: nil)
    result = content

    if user
      result = result.gsub(/[*]user_name[*]/, user.name)
      .gsub(/[*]user_email[*]/, user.email)
      if token
        result = result.gsub(/[*]confirmation_link[*]/, (link_to t('devise.confirm_my_account', locale: user.language), confirmation_url(user, confirmation_token: token)))
        .gsub(/[*]reset_password_link[*]/, (link_to t('devise.change_my_password', locale: user.language), edit_password_url(@resource, reset_password_token: @token)))
      end
    end

    if event
      result = result.gsub(/[*]event_name[*]/, event.title)
      .gsub(/[*]event_description[*]/, event.body)
    end

    result = result.gsub(/[*]site_name[*]/, Setting.site_name)

    result
  end
end
