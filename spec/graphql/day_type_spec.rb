require 'rails_helper'

RSpec.describe 'days', type: :request do
  include GraphqlSpecHelper

  it_should_behave_like(
    'a graphql query for',
    graphql_name: 'days',
    model_class: Day,
    properties: %i[id number]
  ) do
    let(:json_day) { nodes.first }
    let(:day) { FactoryBot.create :day }

    describe 'the "date" field ' do
      let(:node_query) { 'date' }
      before { day }
      it 'should be the stringified date of the Day' do
        expect(json_day[:date]).to eq day.date.to_s
      end
    end

    describe 'the "post" field' do
      let(:node_query) { 'post { content }' }
      it 'should be the Post associated with the Day' do
        FactoryBot.create :post, day: day, content: 'It was good'
        expect(json_day[:post][:content]).to include('It was good')
      end
    end

    describe 'the "locations" connection' do
      let(:node_query) { 'locations { edges { node { name } } }' }
      let(:locations) { FactoryBot.create_list :location, 2 }

      before { day.locations << locations }

      it 'should be the Locations for the Country' do
        place_names = json_day[:locations][:edges].map { |e| e[:node][:name] }
        expect(place_names).to eq locations.map(&:name)
      end
    end

    describe 'the "expenses" connection' do
      let(:node_query) { "expenses { edges { node { #{expense_query} } } }" }
      let(:expense_query) { 'category' }
      let(:json_expenses) { json_day[:expenses][:edges].map { |e| e[:node] } }
      before { day }

      context 'when there are no expenses for the Day' do
        it 'should return an empty array' do
          expect(json_expenses).to eq([])
        end
      end

      context 'when there are expenses for other days' do
        before { FactoryBot.create :expense }
        it 'should return an empty array' do
          expect(json_expenses).to eq([])
        end
      end

      context 'when there are expenses for the days' do
        before { FactoryBot.create_list :expense, 2, day: day }
        it 'should return a result for each expense' do
          expect(json_expenses.size).to eq(2)
        end
      end

      describe 'an individual expense' do
        let(:json_expense) { json_expenses.first }
        let!(:expense) do
          FactoryBot.create(
            :expense,
            day: day,
            amount: 100,
            currency_code: Currency::GBP.code,
            category: Expense::Category::FOOD,
            description: 'something tasty'
          )
        end

        describe 'the "category" field' do
          let(:expense_query) { 'category' }
          it 'should be the string on the underlying Expense' do
            expect(json_expense[:category]).to eq('FOOD')
          end
        end

        describe 'the "description" field' do
          let(:expense_query) { 'description' }
          it 'should be the string on the underlying Expense' do
            expect(json_expense[:description]).to eq('something tasty')
          end
        end

        describe 'the "day" field' do
          let(:expense_query) { 'day { number }' }
          it 'should be a link back to the Day' do
            expect(json_expense[:day][:number]).to eq(day.number)
          end
        end

        describe 'the "price" field' do
          let(:expense_query) { "price { #{price_query} }" }
          let(:json_price) { json_expense[:price] }

          describe 'the "amount" field' do
            let(:price_query) { 'amount' }
            it 'should be the number on the underlying Expense' do
              expect(json_price[:amount]).to eq(100)
            end
          end

          describe 'the "currency" field' do
            let(:price_query) { "currency { #{currency_query} }" }
            let(:json_currency) { json_price[:currency] }

            describe 'the "code" field' do
              let(:currency_query) { 'code' }
              it 'should be the string on the underlying Currency' do
                expect(json_currency[:code]).to eq('GBP')
              end
            end

            describe 'the "name" field' do
              let(:currency_query) { 'name' }
              it 'should be the string on the underlying Currency' do
                expect(json_currency[:name]).to eq('pounds')
              end
            end

            describe 'the "symbol" field' do
              let(:currency_query) { 'symbol' }
              it 'should be the string on the underlying Currency' do
                expect(json_currency[:symbol]).to eq('£')
              end
            end
          end

          describe 'the "convertTo" field' do
            let(:price_query) { 'converted: convertTo(code: "USD") { amount currency { code } }' }

            it 'should return a Price with the specified currency code' do
              expect(json_price[:converted][:currency][:code]).to eq('USD')
            end

            context 'if the currency code is not known' do
              let(:price_query) { 'converted: convertTo(code: "BLA") { amount }' }
              it 'should return an error' do
                expect(result[:errors]).not_to be_empty
              end
            end
          end
        end
      end
    end
  end
end
