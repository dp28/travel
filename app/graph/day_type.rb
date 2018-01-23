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

  field :post do
    type !PostType
    resolve ->(day, _, _) { day.post }
  end

  connection :expenses, ExpenseType.connection_type do
    description 'Things bought on or for this Day'
    resolve ->(day, _, _) { day.expenses }
  end
end
