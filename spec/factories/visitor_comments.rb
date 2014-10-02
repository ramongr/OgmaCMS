# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visitor_comment do
    subject 'MyString'
    name 'MyString'
    email 'MyString'
    content 'MyText'
  end
end
