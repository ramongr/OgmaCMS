class SystemMailer < ActionMailer::Base
  include AbstractController::Callbacks

  after_filter :check_subscription, only: :newsletter_send

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

    mail(to: @user.email, subject: parseEmail(@newsletter.send('subject_' + @user.language), user: @user))
  end

  def check_subscription
    unless @user.newsletter_subscribed
      mail.perform_deliveries = false
    end
  end

end
