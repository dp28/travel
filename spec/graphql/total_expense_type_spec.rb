require 'rails_helper'

RSpec.describe 'totalExpense', type: :request do
  include GraphqlSpecHelper
  let!(:food_100_thb_day_1) do
    FactoryBot.create(
      :expense,
      amount: 100,
      currency_code: 'THB',
      category: Expense::Category::FOOD
    )
  end

  let!(:other_200_thb_day_2) do
    FactoryBot.create(
      :expense,
      amount: 200,
      currency_code: 'THB',
      category: Expense::Category::OTHER
    )
  end

  let(:query) do
    %({
      totalExpense {
        category
        price {
          amount
          currency {
            code
          }
        }
        expenses {
          edges {
            node {
              category
            }
          }
        }
      }
    })
  end

  let(:total) { result[:data][:totalExpense] }

  context 'without any arguments' do
    it 'should have an amount that is a sum of all the Expenses' do
      expect(total[:price][:amount]).to eq(100 + 200)
    end

    it 'should have a Currency' do
      expect(total[:price][:currency][:code]).to eq 'THB'
    end

    it 'should have a subnode for each expense' do
      expect(total[:expenses][:edges].size).to eq(2)
    end
  end

  context 'with a days argument' do
    let(:query) do
      %({
        totalExpense(days: [#{food_100_thb_day_1.day.number}]) {
          price {
            amount
          }
        }
      })
    end

    it 'should only include expenses from that day' do
      expect(total[:price][:amount]).to eq(100)
    end
  end

  context 'with a categories argument' do
    let(:query) do
      %({
        totalExpense(categories: ["FOOD"]) {
          price {
            amount
          }
        }
      })
    end

    it 'should only include expenses from that category' do
      expect(total[:price][:amount]).to eq(100)
    end
  end
end
