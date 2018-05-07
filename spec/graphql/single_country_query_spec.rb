require 'rails_helper'

RSpec.describe 'country($name)', type: :request do
  include GraphqlSpecHelper

  let(:query) do
    %({
      country(name: "#{country_name}") {
        name
      }
    })
  end

  let!(:country) { FactoryBot.create :country }
  let(:country_name) { country.name }

  it 'should return a CountryType with the correct name' do
    expect(result[:data][:country][:name]).to eq(country.name)
  end

  context 'if there is no Country with the name' do
    let(:country_name) { -1 }

    it 'should return null' do
      expect(result[:data][:country]).to eq(nil)
    end
  end
end
