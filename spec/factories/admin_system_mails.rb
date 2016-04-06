# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_system_mail, :class => 'Admin::SystemMail' do
    subject "MyString"
    content "MyText"
  end
end
