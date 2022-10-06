FactoryBot.define do
  factory :meal_food do
    association :meal
    association :food
  end
end
