FactoryBot.define do
  sequence(:meal_ordering) { |n| n }

  factory :meal do
    ordering { generate :meal_ordering }
    association :day
  end
end
