FactoryBot.define do
  factory :food do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Name-#{n}" }
    sequence(:calories) { |n| 99 + n }
  end
end
