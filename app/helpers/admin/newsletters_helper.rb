module Admin::NewslettersHelper
  def parse(body, user)
    body.gsub(/[*]user_name[*]/,user.name)
    .gsub(/[*]user_email[*]/,user.email)
  end
end
