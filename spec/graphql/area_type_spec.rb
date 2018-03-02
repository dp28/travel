require 'rails_helper'

RSpec.describe 'areas', type: :request do
  include GraphqlSpecHelper

  it_should_behave_like(
    'a graphql query for',
    graphql_name: 'areas',
    model_class: Area,
    properties: %i[id name]
  ) do
    let(:json_area) { nodes.first }
    let(:area) { FactoryBot.create :area }

    describe 'the "country" field' do
      let(:node_query) { 'country { name }' }

      before { area }

      it 'should be the Country of the Area' do
        expect(json_area[:country][:name]).to eq area.country.name
      end
    end

    describe 'the "days" connection' do
      let(:node_query) { 'days { edges { node { number } } }' }
      let(:days) { FactoryBot.create_list :day, 2 }
      let(:location) { FactoryBot.create :location }

      before do
        area.locations << [location]
        location.days << days
        days.each do |day|
          location.accommodations.create day: day
        end
      end

      it 'should be the Days for the Locations in the Area' do
        day_numbers = json_area[:days][:edges].map { |e| e[:node][:number] }
        expect(day_numbers).to eq days.map(&:number)
      end
    end

    describe 'the "locations" connection' do
      let(:node_query) { 'locations { edges { node { name } } }' }
      let(:locations) { FactoryBot.create_list :location, 2 }

      before { area.locations << locations }

      it 'should be the Locations in the Area' do
        location_names = json_area[:locations][:edges].map { |e| e[:node][:name] }
        expect(location_names).to eq locations.map(&:name)
      end
    end

    describe 'the "totalExpense" field' do
      before { area }

      let(:node_query) { 'totalExpense { price { amount } }' }

      it 'should be a TotalExpense type' do
        expect(json_area[:totalExpense][:price][:amount]).to eq(0)
      end
    end
  end
end
