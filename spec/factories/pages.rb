# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :page do
    title { Faker::Name.title }
    slug { Faker::Internet.slug(title, '_') }
    body { Faker::Lorem.paragraph }

    factory :invalid_page do
      title nil
    end

    factory :page_sidebars do
      after(:build) do |page_sidebars|
        page_sidebars.sidebars << FactoryGirl.build(:left_sidebar)
        page_sidebars.sidebars << FactoryGirl.build(:right_sidebar)
        page_sidebars.sidebars << FactoryGirl.build(:top_sidebar)
        page_sidebars.sidebars << FactoryGirl.build(:bottom_sidebar)
      end
    end
  end
end
