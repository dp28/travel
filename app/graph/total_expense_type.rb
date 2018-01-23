TotalExpenseType = GraphQL::ObjectType.define do
  name 'TotalExpense'
  description 'A total made up of multiple Expenses from the trip'

  field :category, !types.String
  field :price, !PriceType

  connection :expenses, ExpenseType.connection_type
end
