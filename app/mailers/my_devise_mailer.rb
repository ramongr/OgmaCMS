class MyDeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers

  def confirmation_instructions(record, token, opts={})
    @mail = SystemMail.find_by(id: 1)
    headers = { subject: @mail.subject }
    super
  end

end
