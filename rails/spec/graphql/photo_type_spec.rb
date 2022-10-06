require 'rails_helper'

RSpec.describe 'photos', type: :request do
  include GraphqlSpecHelper

  it_should_behave_like(
    'a graphql query for',
    graphql_name: 'photos',
    model_class: Photo,
    properties: %i[id url caption width height]
  ) do
    let(:json_photo) { nodes.first }
    let(:photo) { FactoryBot.create :photo }

    describe 'the "aspectRatio" field' do
      let(:node_query) { 'aspectRatio' }
      before { photo }

      it 'should be the float on the underlying Photo' do
        expect(json_photo[:aspectRatio]).to eq(photo.aspect_ratio)
      end
    end

    describe 'the "isFavourite" field' do
      let(:node_query) { 'isFavourite' }
      before { photo }

      it 'should be the boolean on the underlying Photo' do
        expect(json_photo[:isFavourite]).to eq(photo.favourite?)
      end
    end

    describe 'filtering by isFavourite' do
      let(:query) do
        %({
          photos(isFavourite: #{is_favourite}) {
            edges {
              node {
                url
              }
            }
          }
        })
      end

      let!(:favourite) { FactoryBot.create :photo, favourite: true }
      let!(:non_favourite) { FactoryBot.create :photo, favourite: false }

      context 'when set to "true"' do
        let(:is_favourite) { true }
        it 'should only return favourites' do
          expect(nodes).to eq [{ 'url' => favourite.url }]
        end
      end

      context 'when set to "false"' do
        let(:is_favourite) { false }
        it 'should only return non favourites' do
          expect(nodes).to eq [{ 'url' => non_favourite.url }]
        end
      end
    end
  end
end
