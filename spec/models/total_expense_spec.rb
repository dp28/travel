require 'rails_helper'

RSpec.describe TotalExpense do
  subject(:total) { TotalExpense.new(expenses: expenses) }

  context 'when created without any expenses' do
    let(:expenses) { [] }
    describe '#amount' do
      subject { total.amount }
      it { should be 0 }
    end

    describe '#category' do
      subject { total.category }
      it { should be TotalExpense::Category::COMBINED }
    end

    describe '#currency_code' do
      it 'should be the default currency code' do
        expect(total.currency_code).to be Currency::DEFAULT.code
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
          expect(total.amount).to eq(300)
        end
      end

      describe '#currency_code' do
        it 'should be the same currency code as the on the expenses' do
          expect(total.currency_code).to eq(expenses.first.currency_code)
        end
      end

      describe '#price' do
        it 'is a CurrencyAmount built from the currency_code and amount' do
          expect(total.price.currency.code.to_s).to eq(total.currency_code)
          expect(total.price.amount).to eq(total.amount)
        end
      end

      describe '#average_price_per_day' do
        it 'is a CurrencyAmount built from the currency_code and amount divided by the number of days' do
          expect(total.average_price_per_day.currency.code.to_s).to eq(total.currency_code)
          expect(total.average_price_per_day.amount).to eq(total.amount / 2)
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
          expect(total.amount).to eq(
            expenses
              .map(&:price)
              .map { |p| p.convert_to Currency::DEFAULT }
              .sum(&:amount)
          )
        end
      end

      describe '#currency_code' do
        it 'should be the default currency' do
          expect(total.currency_code).to eq(Currency::DEFAULT.code)
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
          expect(total.category).to eq(Expense::Category::FOOD)
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
        it 'should be the COMBINED category' do
          expect(total.category).to eq(TotalExpense::Category::COMBINED)
        end
      end

      describe '#within_category' do
        it 'should return a new TotalExpense using only the specified category' do
          food = total.within_category(Expense::Category::FOOD)
          expect(food.price.amount).to eq expenses.first.amount
        end
      end
    end
  end

  describe '.calculate' do
    it 'should return a TotalExpense' do
      expect(TotalExpense.calculate(days: [1])).to be_a TotalExpense
    end

    it 'should include all expenses' do
      FactoryBot.create :expense
      FactoryBot.create :expense
      expect(TotalExpense.calculate.expenses).to eq Expense.all
    end

    context 'if categories are passed' do
      it 'should include only the expenses with those categories' do
        FactoryBot.create :expense, category: Expense::Category::ACCOMMODATION
        food = FactoryBot.create :expense, category: Expense::Category::FOOD
        other = FactoryBot.create :expense, category: Expense::Category::OTHER
        categories = [Expense::Category::FOOD, Expense::Category::OTHER]

        total = TotalExpense.calculate categories: categories

        expect(total.expenses).to eq [food, other]
      end
    end

    context 'if days are passed' do
      it 'should include expenses for only the passed-in days' do
        day_1_expense = FactoryBot.create :expense
        day_2_expense = FactoryBot.create :expense
        FactoryBot.create :expense
        total_excluding_last = TotalExpense.calculate(
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
          total_food_excluding_last = TotalExpense.calculate(
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
