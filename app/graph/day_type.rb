DayType = GraphQL::ObjectType.define do
  name 'Day'
  description 'A single day of the trip'

  implements GraphQL::Relay::Node.interface

  field :id do
    type !types.ID
    resolve lambda { |day, _, _|
      GraphQL::Schema::UniqueWithinType.encode('Day', day.id)
    }
  end

  field :number, types.Int
  field :date, types.String
  field :post, !PostType

  connection :locations, LocationType.connection_type
  connection :expenses, ExpenseType.connection_type
  connection :photos, PhotoType.connection_type
end
