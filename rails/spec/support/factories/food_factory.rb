FactoryBot.define do
  sequence(:food_name) { |n| "test food #{n}" }

  factory :food do
    name { generate :food_name }
  end
end
