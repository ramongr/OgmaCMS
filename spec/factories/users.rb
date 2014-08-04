# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email}
    password 'secret123'
    password_confirmation 'secret123'

    factory :super_admin do
      role 'super_admin'
    end

    factory :admin do
      role 'admin'
    end

    factory :author do
      role 'author'
    end

    factory :registered do
      role 'registered'
    end

    factory :invalid_user do
      email nil
    end
  end
end
