class SystemMailer < ActionMailer::Base
  include ApplicationHelper
  helper ApplicationHelper
  default from: "from@example.com"

  def event_update(event, user)
    @user = user
    @event = event
    mail(to: @user.email, subject: Setting.site_name + ': Event ' + @event.title + ' changed')
  end

  def newsletter_send(newsletter, user)
    @user = user
    @newsletter = newsletter
    mail(to: @user.email, subject: Setting.site_name + ': ' + @newsletter.title) do |format|
      format.html { render text: parseNewsletter(@newsletter.body, user = @user) }
    end
  end
end
