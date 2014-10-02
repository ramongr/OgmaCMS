# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title 'MyString'
    body 'MyText'
    start_time '2014-08-07 12:43:04'
    end_time '2014-08-07 12:43:04'
  end
end
