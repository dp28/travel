ExpenseType = GraphQL::ObjectType.define do
  name 'Expense'
  description 'Something bought during or for the trip'

  field :category, !types.String
  field :description, types.String
  field :day, !DayType
  field :price, !PriceType
end
