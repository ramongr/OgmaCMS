json.array!(@system_mails) do |system_mail|
  json.extract! system_mail, :id, :subject, :content
  json.url admin_system_mail_url(admin_system_mail, format: :json)
end
