require 'rails_helper'

RSpec.describe 'days', type: :request do
  include GraphqlSpecHelper

  it_should_behave_like(
    'a graphql query for',
    graphql_name: 'days',
    model_class: Day,
    properties: %i[id number]
  )
end
