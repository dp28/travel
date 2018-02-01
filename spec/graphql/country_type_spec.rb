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

    describe 'the "locations" connection' do
      let(:node_query) { 'locations { edges { node { placeName } } }' }
      let(:locations) { FactoryBot.create_list :location, 2 }

      before { country.locations << locations }

      it 'should be the Locations for the Country' do
        place_names = json_country[:locations][:edges].map { |e| e[:node][:placeName] }
        expect(place_names).to eq locations.map(&:place_name)
      end
    end
  end
end
