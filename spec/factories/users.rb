# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email}
    password 'secret123'
    password_confirmation 'secret123'

    factory :invalid_user do
      email nil
    end
  end
end
