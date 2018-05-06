require 'rails_helper'

RSpec.describe 'countries', type: :request do
  include GraphqlSpecHelper

  it_should_behave_like(
    'a graphql query for',
    graphql_name: 'countries',
    model_class: Country,
    properties: %i[id name]
  ) do
    let(:json_country) { nodes.first }
    let(:country) { FactoryBot.create :country }

    describe 'the "areas" connection' do
      let(:node_query) { 'areas { edges { node { name } } }' }
      let(:areas) { FactoryBot.create_list :area, 2 }

      before { country.areas << areas }

      it 'should be the Areas for the Country' do
        area_names = json_country[:areas][:edges].map { |e| e[:node][:name] }
        expect(area_names).to eq areas.map(&:name)
      end

      describe 'the "locations" connection on each Area' do
        let(:node_query) { 'areas { edges { node { locations { edges { node { name } } } } } }' }
        let(:locations) { FactoryBot.create_list :location, 2 }

        before { areas.first.locations << locations }

        it 'should be the Locations for the Area' do
          json_location_edges = json_country[:areas][:edges].first[:node][:locations][:edges]
          expect(json_location_edges.map { |e| e[:node][:name] }).to eq locations.map(&:name)
        end
      end
    end

    describe 'the "totalExpense" field' do
      before { country }

      let(:node_query) { 'totalExpense { price { amount } }' }

      it 'should be a TotalExpense type' do
        expect(json_country[:totalExpense][:price][:amount]).to eq(0)
      end
    end

    describe 'the "foodOccurrences" field' do
      before { country }

      let(:node_query) { 'foodOccurrences { name }' }

      it 'should be a FoodOccurrences type' do
        expect(json_country[:foodOccurrences].size).to eq(0)
      end
    end
  end
end
