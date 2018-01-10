module GraphqlSpecHelper

  extend ActiveSupport::Concern

  included do
    shared_examples_for 'a graphql query for' do |config|
      model_name = config[:model_class].name

      subject(:result) do
        post '/graphql', params: { query: query }
        JSON.parse(response.body).with_indifferent_access
      end

      let(:query) do
        %({
          #{config[:graphql_name]} {
            edges {
              node {
                #{config[:properties].join("\n")}
              }
            }
          }
        })
      end

      let(:nodes) do
        result[:data][config[:graphql_name]][:edges].map { |edge| edge[:node] }
      end

      it 'should not return errors' do
        expect(result[:errors]).to be_nil
      end

      context "without any #{model_name.pluralize}" do
        it 'should return an empty array as the edges' do
          expect(result[:data][config[:graphql_name]][:edges]).to eq []
        end
      end

      context "with a single #{model_name}" do
        let!(:model) { FactoryBot.create model_name.downcase.to_sym }

        it 'should return an array with one element' do
          expect(nodes.size).to eq 1
        end

        describe 'the returned DayType' do
          subject(:node) { nodes.first }

          config[:properties].reject { |p| p == :id }.each do |field|
            it "should have the same #{field} as the stored #{model_name}" do
              expect(node[field]).to eq model.send(field)
            end
          end

          describe 'the (decoded) id field' do
            subject(:decoded_id) do
              GraphQL::Schema::UniqueWithinType.decode(node[:id])
            end

            it "should include '#{model_name}'" do
              expect(decoded_id[0]).to eq model_name
            end

            it "should include the database model's id" do
              expect(decoded_id[1]).to eq model.id.to_s
            end
          end
        end
      end
    end
  end

end
