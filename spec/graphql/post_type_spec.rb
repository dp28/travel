require 'rails_helper'

RSpec.describe 'posts', type: :request do
  subject(:result) do
    post '/graphql', params: { query: query }
    JSON.parse(response.body).with_indifferent_access
  end

  let(:query) do
    %({
      posts {
        edges {
          node {
            id
            title
            content
            published_at
          }
        }
      }
    })
  end

  let(:posts) do
    result[:data][:posts][:edges].map { |edge| edge[:node] }
  end

  it 'should not return errors' do
    expect(result[:errors]).to be_nil
  end

  context 'without any posts' do
    it 'should return an empty array as the edges' do
      expect(result[:data][:posts][:edges]).to eq []
    end
  end

  context 'with a single post' do
    let!(:db_post) { FactoryBot.create :post }

    it 'should return an array with one element' do
      expect(posts.size).to eq 1
    end

    describe 'the returned PostType' do
      subject(:json_post) { posts.first }

      %i[title content].each do |field|
        it "should have the same #{field} as the stored Post" do
          expect(json_post[field]).to eq db_post.send(field)
        end
      end

      it 'should have a string representation of the published_at time' do
        expect(json_post[:published_at]).to eq(db_post.published_at.to_s)
      end

      describe 'the (decoded) id field' do
        subject(:decoded_id) do
          GraphQL::Schema::UniqueWithinType.decode(json_post[:id])
        end

        it 'should include "Post"' do
          expect(decoded_id[0]).to eq 'Post'
        end

        it 'should include the database Post\'s id' do
          expect(decoded_id[1]).to eq db_post.id.to_s
        end
      end
    end
  end
end
