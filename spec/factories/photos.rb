# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    gallery nil
    attachment nil
    position 1
  end
end
