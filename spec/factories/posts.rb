# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title { Faker::Name.title }
    content { Faker::Lorem.paragraph }
    user { create(:admin) }

    factory :invalid_post do
      title nil
    end
  end
end
