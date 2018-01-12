require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should have_db_column(:id) }
  it { should have_db_column(:created_at) }

  %i[amount currency_code category day_id].each do |column|
    it { should have_db_column(column).with_options(null: false) }
    it { should validate_presence_of column }
  end

  it do
    should validate_inclusion_of(:category).in_array(
      %w[
        FOOD
        ACCOMMODATION
        LONG_DISTANCE_TRAVEL
        SHORT_TRAVEL
        ACTIVITIES
        OTHER
        COMBINED
      ]
    )
  end

  it { should have_db_column(:description) }

  it { should belong_to :day }

  describe '#price' do
    subject(:price) { expense.price }
    let(:expense) { Expense.new currency_code: :USD, amount: 100 }
    it { should be_a CurrencyAmount }

    it 'should be of the persisted Currency code' do
      expect(price.currency.code).to eq :USD
    end

    it 'should have the persisted amount' do
      expect(price.amount).to eq 100
    end
  end
end
