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

  field :latitude, !types.Float
  field :longitude, !types.Float
  field :name, !types.String
  field :type, !types.String
  field :area, !AreaType

  connection :days, DayType.connection_type
end
