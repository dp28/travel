FoodOccurrenceType = GraphQL::ObjectType.define do
  name 'FoodOccurrence'
  description 'A single food or drink that has been consumed during the trip, and how often'

  field :name, !types.String
  field :count, !types.Int
end
