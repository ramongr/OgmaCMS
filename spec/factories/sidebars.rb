# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sidebar do
    title { Faker::Name.title }

    factory :left_sidebar do
      type_mask 0

      factory :left_sidebar_pages do
        after(:build) do |sidebar|
          (0..3).each do |_i|
            sidebar.pages << FactoryGirl.build(:page)
          end
        end
      end
    end

    factory :right_sidebar do
      type_mask 1

      factory :right_sidebar_pages do
        after(:build) do |sidebar|
          (0..3).each do |_i|
            sidebar.pages << FactoryGirl.build(:page)
          end
        end
      end
    end

    factory :top_sidebar do
      type_mask 2

      factory :top_sidebar_pages do
        after(:build) do |sidebar|
          (0..3).each do |_i|
            sidebar.pages << FactoryGirl.build(:page)
          end
        end
      end
    end

    factory :bottom_sidebar do
      type_mask 3

      factory :bottom_sidebar_pages do
        after(:build) do |sidebar|
          (0..3).each do |_i|
            sidebar.pages << FactoryGirl.build(:page)
          end
        end
      end
    end

    factory :invalid_sidebar do
      title nil
    end
  end

end
