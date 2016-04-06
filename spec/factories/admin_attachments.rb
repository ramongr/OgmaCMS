# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_attachment, class: 'Admin::Attachment' do
    name 'MyString'
    description 'MyText'
  end
end
