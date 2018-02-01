require 'rails_helper'

RSpec.describe 'locations', type: :request do
  include GraphqlSpecHelper

  it_should_behave_like(
    'a graphql query for',
    graphql_name: 'locations',
    model_class: Location,
    properties: %i[id latitude longitude accommodation]
  ) do
    let(:json_location) { nodes.first }
    let(:location) { FactoryBot.create :location }

    describe 'the "placeName" field' do
      let(:node_query) { 'placeName' }

      before { location }

      it 'should be the place_name from the Location' do
        expect(json_location[:placeName]).to eq location.place_name
      end
    end

    describe 'the "country" field' do
      let(:node_query) { 'country { name }' }

      before { location }

      it 'should be the Country for the Location' do
        expect(json_location[:country][:name]).to eq location.country.name
      end
    end

    describe 'the "days" connection' do
      let(:node_query) { 'days { edges { node { number } } }' }
      let(:days) { FactoryBot.create_list :day, 2 }

      before { location.days << days }

      it 'should be the Days for the Location' do
        day_numbers = json_location[:days][:edges].map { |e| e[:node][:number] }
        expect(day_numbers).to eq days.map(&:number)
      end
    end
  end
end
