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
            publishedAt
            writtenAt
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
    let!(:db_post) { FactoryBot.create :post, content: content_text }
    let(:content_text) { 'It was good' }

    it 'should return an array with one element' do
      expect(posts.size).to eq 1
    end

    describe 'the returned PostType' do
      subject(:json_post) { posts.first }

      it 'should have the same title as the stored Post' do
        expect(json_post[:title]).to eq db_post.title
      end

      %i[published_at written_at].each do |field|
        it "should have a camelCase string representation of the #{field}" do
          json_field_name = field.to_s.camelize(:lower)
          expect(json_post[json_field_name]).to eq(db_post.send(field).to_s)
        end
      end

      describe 'the content field' do
        subject(:returned_content) { json_post[:content] }
        let(:content_text) { "# Title\nIt was good" }

        it 'have the content of the Post rendered as HTML, not Markdown' do
          expect(returned_content).to eq("<h1>Title</h1>\n\n<p>It was good</p>\n")
        end

        context 'if there is content tagged as written by Rosie' do
          let(:content_text) do
            %(
Written by _Daniel_

<R>
Written by _Rosie_
</R>
            )
          end

          let(:expected_html) do
            %(<p>Written by <em>Daniel</em></p>

<p><div class="Rosie">
Written by <em>Rosie</em>
</div></p>
)
          end

          it 'should replace the tags with divs with a special class' do
            expect(returned_content).to eq(expected_html)
          end
        end
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
