module ApplicationHelper
  def parseEmail(content, user: nil, event: nil, token: nil, newsletter: nil)
    result = content

    if user
      result = result.gsub(/[*]user_name[*]/, user.name)
      .gsub(/[*]user_email[*]/, user.email)
      if token
        result = result.gsub(/[*]confirmation_link[*]/, (link_to t('devise.confirm_my_account', locale: user.language), confirmation_url(user, confirmation_token: token)))
        .gsub(/[*]reset_password_link[*]/, (link_to t('devise.change_my_password', locale: user.language), edit_password_url(user, reset_password_token: token)))
      end
    end

    if event
      date = l(event.start_time, format: :full_date, locale: user.language.to_sym).to_s
      unless event.end_time.blank?
        date = date + " - " + l(event.end_time, format: :full_date, locale: user.language.to_sym).to_s
      end
      result = result.gsub(/[*]event_name[*]/, event.title)
      .gsub(/[*]event_description[*]/, event.body)
      .gsub(/[*]event_date[*]/, date)
    end

    if newsletter
      result = result.gsub(/[*]unsubscribe_url[*]/, link_to(t('newsletters.unsubscribe'), registrations_unsubscribe_url(token: @user.unsubscribe_token)).html_safe)
    end

    result = result.gsub(/[*]site_name[*]/, Setting.site_name)

    result
  end

  def sortable(column, title = nil)
    title ||= column.titleize

    if column == sort_column
      if sort_direction == 'asc'
        direction = 'desc'
        direction_css = 'fi-arrow-down'
      else
        direction = 'asc'
        direction_css = 'fi-arrow-up'
      end
    else
      direction_css = ''
    end

    link_to (title + " " + content_tag(:i, '', class: direction_css)).html_safe, admin_events_path(sort: column, direction: direction, page: nil)
  end

end
