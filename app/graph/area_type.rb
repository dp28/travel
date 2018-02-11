AreaType = GraphQL::ObjectType.define do
  name 'Area'
  description 'An area within a country visited during the trip'

  implements GraphQL::Relay::Node.interface

  field :id do
    type !types.ID
    resolve lambda { |country, _, _|
      GraphQL::Schema::UniqueWithinType.encode('Area', country.id)
    }
  end

  field :name, !types.String
  field :country, !CountryType
  connection :locations, !LocationType.connection_type
  connection :days, !DayType.connection_type
end
