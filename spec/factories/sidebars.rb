# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sidebar do
    title { Faker::Name.title }

    factory :left_sidebar do
      type_mask 0
    end

    factory :right_sidebar do
      type_mask 1
    end

    factory :top_sidebar do
      type_mask 2
    end

    factory :bottom_sidebar do
      type_mask 3
    end

    factory :invalid_sidebar do
      title nil
    end

    #comment to test static_pages
    after(:build) do |sidebar|
      (0..3).each do |i|
        sidebar.static_pages << FactoryGirl.build(:static_page)
      end
    end

  end
end
