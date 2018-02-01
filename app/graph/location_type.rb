LocationType = GraphQL::ObjectType.define do
  name 'Location'
  description 'A location visited during the trip'

  implements GraphQL::Relay::Node.interface

  field :id do
    type !types.ID
    resolve lambda { |location, _, _|
      GraphQL::Schema::UniqueWithinType.encode('Location', location.id)
    }
  end

  field :latitude, types.Float
  field :longitude, types.Float
  field :accommodation, types.String
  field :country, CountryType

  connection :days, DayType.connection_type

  field :placeName do
    type types.String
    resolve ->(location, _, _) { location.place_name }
  end
end
