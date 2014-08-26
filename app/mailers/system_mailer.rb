class SystemMailer < ActionMailer::Base
  default from: "from@example.com"

  def event_update(event, user)
    @user = user
    @event = event
    mail(to: @user.email, subject: Setting.site_name + ': Event ' + @event.title + ' changed')
  end

  def newsletter_send(newsletter, user)
    @user = user
    @newsletter = newsletter
    mail(to: @user.email, subject: Setting.site_name + ': ' + @newsletter.title, body: @newsletter.body)
  end
end
