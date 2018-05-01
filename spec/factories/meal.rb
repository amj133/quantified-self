FactoryBot.define do
  factory :meal do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Meal-#{n}" }
  end
end
