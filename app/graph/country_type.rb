CountryType = GraphQL::ObjectType.define do
  name 'Country'
  description 'A country visited during the trip'

  implements GraphQL::Relay::Node.interface

  field :id do
    type !types.ID
    resolve lambda { |country, _, _|
      GraphQL::Schema::UniqueWithinType.encode('Country', country.id)
    }
  end

  field :name, types.String
  connection :locations, LocationType.connection_type
end
