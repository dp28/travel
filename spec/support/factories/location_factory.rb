FactoryBot.define do
  factory :location do
    name 'Here'
    latitude 3.14
    longitude 100.789
    type Location::Type::ACCOMMODATION
    association :area
  end
end
