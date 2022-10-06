FactoryBot.define do
  factory :expense do
    association :day

    amount 100
    currency_code 'USD'
    category Expense::Category::OTHER
  end
end
