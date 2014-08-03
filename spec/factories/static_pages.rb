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

    #comment to test sidebars
    #after(:build) do |static_page|
    #  static_page.sidebars << FactoryGirl.build(:left_sidebar)
    #  static_page.sidebars << FactoryGirl.build(:right_sidebar)
    #  static_page.sidebars << FactoryGirl.build(:top_sidebar)
    #  static_page.sidebars << FactoryGirl.build(:bottom_sidebar)
    #end
  end
end