class SystemMailer < ActionMailer::Base
  default from: "from@example.com"

   def event_update(event, user)
    @user = user
    @event = event
    mail(to: @user.email, subject: Setting.site_name + ': Event ' + @event.title + ' changed')
  end
end
