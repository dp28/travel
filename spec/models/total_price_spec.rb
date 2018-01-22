require 'rails_helper'

RSpec.describe TotalPrice do
  subject(:price) { TotalPrice.new(expenses: expenses) }

  context 'when created without any expenses' do
    let(:expenses) { [] }
    describe '#amount' do
      subject { price.amount }
      it { should be 0 }
    end

    describe '#category' do
      subject { price.category }
      it { should be TotalPrice::Category::COMBINED }
    end

    describe '#currency' do
      it 'should be the default currency' do
        expect(price.currency).to be Currency::DEFAULT
      end
    end
  end

  context 'when created with multiple expenses' do
    context 'with the same currency' do
      let(:expenses) do
        [
          FactoryBot.build(:expense, amount: 100, currency_code: 'THB'),
          FactoryBot.build(:expense, amount: 200, currency_code: 'THB')
        ]
      end

      describe '#amount' do
        it 'should be a sum of all the amounts of the expenses' do
          expect(price.amount).to eq(300)
        end
      end

      describe '#currency' do
        it 'should be the same currency as the on the expenses' do
          expect(price.currency).to eq(expenses.first.price.currency)
        end
      end
    end

    context 'with different currencies' do
      let(:expenses) do
        [
          FactoryBot.build(:expense, amount: 100, currency_code: 'GBP'),
          FactoryBot.build(:expense, amount: 200, currency_code: 'THB')
        ]
      end

      describe '#amount' do
        it 'should be a sum of all the amounts of the expenses converted to the default currency' do
          expect(price.amount).to eq(
            expenses
              .map(&:price)
              .map { |p| p.convert_to Currency::DEFAULT }
              .sum(&:amount)
          )
        end
      end

      describe '#currency' do
        it 'should be the default currency' do
          expect(price.currency).to eq(Currency::DEFAULT)
        end
      end
    end

    context 'with the same category' do
      let(:expenses) do
        [
          FactoryBot.build(:expense, category: Expense::Category::FOOD),
          FactoryBot.build(:expense, category: Expense::Category::FOOD)
        ]
      end

      describe '#category' do
        it 'be the same category as on the expenses' do
          expect(price.category).to eq(Expense::Category::FOOD)
        end
      end
    end

    context 'with different categories' do
      let(:expenses) do
        [
          FactoryBot.build(:expense, category: Expense::Category::FOOD),
          FactoryBot.build(:expense, category: Expense::Category::OTHER)
        ]
      end

      describe '#category' do
        it 'be the COMBINED category' do
          expect(price.category).to eq(TotalPrice::Category::COMBINED)
        end
      end
    end
  end

  describe '.calculate' do
    it 'should return a TotalPrice' do
      expect(TotalPrice.calculate(days: [1])).to be_a TotalPrice
    end

    it 'should include all expenses' do
      FactoryBot.create :expense
      FactoryBot.create :expense
      expect(TotalPrice.calculate.expenses).to eq Expense.all
    end

    context 'if categories are passed' do
      it 'should include only the expenses with those categories' do
        FactoryBot.create :expense, category: Expense::Category::ACCOMMODATION
        food = FactoryBot.create :expense, category: Expense::Category::FOOD
        other = FactoryBot.create :expense, category: Expense::Category::OTHER

        price = TotalPrice.calculate categories: [Expense::Category::FOOD, Expense::Category::OTHER]

        expect(price.expenses).to eq [food, other]
      end
    end

    context 'if days are passed' do
      it 'should include expenses for only the passed-in days' do
        day_1_expense = FactoryBot.create :expense
        day_2_expense = FactoryBot.create :expense
        FactoryBot.create :expense
        total_excluding_last = TotalPrice.calculate(
          days: [
            day_1_expense.day.number,
            day_2_expense.day.number
          ]
        )
        expect(total_excluding_last.expenses).to eq [day_1_expense, day_2_expense]
      end

      context 'and categories are passed' do
        it 'should only use expenses in those categories on those days' do
          day_1_expense = FactoryBot.create :expense, category: Expense::Category::FOOD
          day_2_expense = FactoryBot.create :expense, category: Expense::Category::OTHER
          FactoryBot.create :expense
          total_food_excluding_last = TotalPrice.calculate(
            days: [
              day_1_expense.day.number,
              day_2_expense.day.number
            ],
            categories: [Expense::Category::FOOD]
          )
          expect(total_food_excluding_last.expenses).to eq [day_1_expense]
        end
      end
    end
  end
end
