require 'rails_helper'

RSpec.describe 'releases', type: :request do
  subject(:result) do
    post '/graphql', params: { query: query }
    JSON.parse(response.body).with_indifferent_access
  end

  let(:query) do
    %({
      releases {
        edges {
          node {
            id
            version
            description
            time
            links {
              javascript
              css
            }
          }
        }
      }
    })
  end

  let(:releases) do
    result[:data][:releases][:edges].map { |edge| edge[:node] }
  end

  it 'should not return errors' do
    expect(result[:errors]).to be_nil
  end

  context 'without any releases' do
    before { allow(ReleaseRepository).to receive(:search).and_return([]) }

    it 'should return an empty array as the edges' do
      expect(result[:data][:releases][:edges]).to eq []
    end
  end

  context 'with a single release' do
    let(:release) { Release.new description: 'test' }
    before { allow(ReleaseRepository).to receive(:search).and_return([release]) }

    it 'should return an array with one element' do
      expect(releases.size).to eq 1
    end

    describe 'the returned ReleaseType' do
      subject(:json_release) { releases.first }

      it 'should have the same version as the stored Release' do
        expect(json_release[:version]).to eq(release.version)
      end

      it 'should have the same description as the stored Release' do
        expect(json_release[:description]).to eq(release.description)
      end

      it 'should have a string representation of the release time' do
        expect(json_release[:time]).to eq(release.time.to_s)
      end

      describe 'the (decoded) id field' do
        subject(:decoded_id) do
          GraphQL::Schema::UniqueWithinType.decode(json_release[:id])
        end

        it 'should include "Release"' do
          expect(decoded_id[0]).to eq 'Release'
        end

        it 'should include the version' do
          expect(decoded_id[1]).to eq release.version
        end
      end

      describe 'the links field' do
        subject(:json_links) { json_release[:links] }
        let(:links) { release.links }

        it 'should have the same javascript link as the stored Release' do
          expect(json_links[:javascript]).to eq(links.javascript)
        end

        it 'should have the same css link as the stored Release' do
          expect(json_links[:css]).to eq(links.css)
        end
      end
    end
  end
end
