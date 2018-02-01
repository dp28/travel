FactoryBot.define do
  factory :location do
    place_name 'Here'
    accommodation 'There'
    latitude 3.14
    longitude 100.789
    association :country
  end
end
