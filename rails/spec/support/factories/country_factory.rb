FactoryBot.define do
  sequence(:country_name) { |n| "Country #{n}" }

  factory :country do
    name { generate :country_name }
    currency_code Currency::DEFAULT.code
  end
end
