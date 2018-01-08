FactoryBot.define do
  factory :post do
    title 'Test post'
    content "# Some long content\n\nPossibly in *markdown*"
    written_at 1.day.ago
  end
end
