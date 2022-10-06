FactoryBot.define do
  sequence(:photo_url) { |n| "http://example.com/#{n}.jpg" }
  factory :photo do
    url { generate(:photo_url) }
    favourite false
    width 16
    height 9
    association :day
  end
end
