class MyDeviseMailer < Devise::Mailer
  include ApplicationHelper
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers

  def confirmation_instructions(record, token, opts={})
    @mail = SystemMail.find_by(action: 'email_confirmation')
    mail = super
    mail.subject = parseEmail(@mail.send('subject_' + @user.language), user: @resource)
    mail
  end

  def reset_password_instructions(record, token, opts={})
    @mail = SystemMail.find_by(action: 'reset_password')
    mail = super
    mail.subject = parseEmail(@mail.send('subject_' + @user.language), user: @resource)
    mail
  end
end
