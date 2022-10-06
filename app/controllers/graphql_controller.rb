class GraphqlController < ApplicationController

  skip_before_action :verify_authenticity_token

  def resolve
    query_variables = params[:variables] || {}
    uri = URI('http://www.rndtravels.com/graphql')
    res = Net::HTTP.post(uri, params.to_json, "Content-Type" => "application/json")
    render json: JSON.parse(res.body)
  end

end
