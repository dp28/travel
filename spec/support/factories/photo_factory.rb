FactoryBot.define do
  sequence(:photo_url) { |n| "http://example.com/#{n}.jpg" }
  factory :photo do
    url { generate(:photo_url) }
    favourite false
    association :day
  end
end
