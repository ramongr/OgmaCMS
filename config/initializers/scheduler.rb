require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '00 04 * * *' do
  User.birthday_email
end