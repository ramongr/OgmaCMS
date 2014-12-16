require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

#Everyday at 04am, check for users birthdays
if Setting.birthday_email_toggle
  scheduler.cron '00 04 * * *' do
    User.birthday_email
  end
end

#Everyday at 03am, check if there are any users with unconfirmed accounts to remove
scheduler.cron '00 03 * * *' do
  User.remove_user
end