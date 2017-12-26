class GraphqlController < ApplicationController

  skip_before_action :verify_authenticity_token

  def resolve
    query_variables = params[:variables] || {}
    result = Schema.execute(
      params[:query],
      variables: query_variables,
      context: {}
    )
    render json: result
  end

end
