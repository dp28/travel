class GraphqlController < ApplicationController

  skip_before_action :verify_authenticity_token

  def resolve
    uri = URI('http://www.rndtravels.com/graphql')
    res = Net::HTTP.post(uri, safe_params.to_json, "Content-Type" => "application/json")
    body = JSON.parse(res.body)
    store(body)
    render json: body
  end

  private

  def safe_params
    @safe_params ||= params.permit!
  end

  def store(body)
    key = { variables: safe_params[:variables] || {}, query: safe_params[:query] }.to_json
    cache[key] = body
    File.write(cache_file, cache.to_json)
    puts "CACHE KEYS: #{cache.keys.size}"
  end

  def cache
    @@cache ||= JSON.parse(File.read(cache_file)) || {}
  end

  def cache_file
    'graphql_cache.json'
  end

end
