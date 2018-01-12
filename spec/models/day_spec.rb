require 'rails_helper'

RSpec.describe Day do
  it { should have_db_column(:id) }
  it { should have_db_column(:number).with_options(null: false) }
  it { should have_db_index(:number).unique }
  it { should validate_presence_of :number }
  it { should validate_numericality_of(:number).is_greater_than(0) }

  it { should have_many :expenses }

  describe '#total_expense' do
    subject(:total_expense) { day.total_expense }
    let(:day) { FactoryBot.create :day }

    it { should be_an Expense }

    it 'should belong o the Day' do
      expect(total_expense.day).to eq day
    end

    it 'should not be persisted' do
      expect(total_expense.persisted?).to be_falsy
    end

    it 'should have the category "COMBINED"' do
      expect(total_expense.category).to eq Expense::Category::COMBINED
    end

    context 'when there are no Expenses for the Day' do
      it 'should have 0 for the amount' do
        expect(total_expense.amount).to eq 0
      end

      it 'should have USD for the currency_code as a default' do
        expect(total_expense.currency_code).to eq 'USD'
      end
    end

    context 'when there are Expenses for the Day' do
      before do
        FactoryBot.create :expense, day: day, amount: 100, currency_code: 'THB'
        FactoryBot.create :expense, day: day, amount: 200, currency_code: 'THB'
      end

      it 'should be a sum of the Expenses\' amounts' do
        expect(total_expense.amount).to eq 300
      end

      context 'if all Expenses are in the same currency' do
        it 'should be in that currency' do
          expect(total_expense.currency_code).to eq 'THB'
        end
      end

      context 'if some Expenses are in different currencies' do
        before do
          FactoryBot.create :expense, day: day, amount: 100, currency_code: 'VND'
        end

        it 'should be in that USD' do
          expect(total_expense.currency_code).to eq 'USD'
        end
      end
    end

    context 'when there are Expenses for other Days' do
      before { FactoryBot.create :expense }

      it 'should still have 0 amount' do
        expect(total_expense.amount).to eq 0
      end
    end

    context 'when passed a specific Expense::Category' do
      subject(:total_expense) { day.total_expense category: category }
      let(:category) { Expense::Category::FOOD }

      it 'should have that category as its category' do
        expect(total_expense.category).to eq category
      end

      it 'should only sum Expenses with that category' do
        FactoryBot.create :expense, day: day, amount: 10, category: category
        FactoryBot.create :expense, day: day, amount: 90, category: category
        FactoryBot.create :expense, day: day, amount: 7, category: Expense::Category::OTHER
        expect(total_expense.amount).to eq 100
      end
    end
  end
end
