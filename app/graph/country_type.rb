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

  field :name, !types.String
  connection :areas, !AreaType.connection_type

  field :totalExpense do
    type !TotalExpenseType
    resolve ->(country, _, _) { country.total_expense }
  end

  field :foodOccurrences do
    type !types[FoodOccurrenceType]
    resolve ->(country, _, _) { country.food_occurrences }
  end
end
