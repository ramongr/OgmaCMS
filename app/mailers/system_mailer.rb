class SystemMailer < ActionMailer::Base
  include AbstractController::Callbacks

  after_filter :check_subscription, :append_footer, only: :newsletter_send

  include ApplicationHelper
  helper ApplicationHelper
  default from: 'from@example.com'

  def event_update(event, user)
    @user = user
    @event = event
    @mail = SystemMail.find_by(id: 3)
    mail(to: @user.email, subject: parseEmail(@mail.send('subject_' + @user.language), user: @user, event: @event))
  end

  def newsletter_send(newsletter, user)
    @user = user
    @newsletter = newsletter

    mail(to: @user.email, subject: parseEmail(@newsletter.subject))
  end

  def check_subscription
    unless @user.newsletter_subscribed
      mail.perform_deliveries = false
    end
  end

  def append_footer
    @unsubscribe_url = view_context.link_to('here!', registrations_unsubscribe_url(token: @user.unsubscribe_token)).html_safe
    @unsubscribe_url = 'If you dont want to receive more Newsletters click ' + @unsubscribe_url

    if mail.html_part
      Replace the html raw_source
      mail.html_part.body.raw_source = mail.html_part.body.raw_source + @unsubscribe_url
    else
      mail.body = String(mail.body) + @unsubscribe_url
    end
  end
end
