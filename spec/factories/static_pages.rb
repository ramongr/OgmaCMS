# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :static_page do   
    title { Faker::Name.title }
    slug { Faker::Internet.slug(title, '_') }
    body { Faker::Lorem.paragraph }

    factory :invalid_static_page do
      title nil
    end
  end
end