FactoryBot.define do
  sequence(:day_number) { |n| n }

  factory :day do
    number { generate :day_number }
  end
end
