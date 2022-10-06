FactoryBot.define do
  factory :accommodation do
    association :day
    association :location
  end
end
