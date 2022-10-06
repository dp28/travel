TotalExpenseType = GraphQL::ObjectType.define do
  name 'TotalExpense'
  description 'A total made up of multiple Expenses from the trip'

  field :category, !types.String
  field :price, !PriceType

  field :averagePricePerDay do
    type !PriceType
    resolve ->(total, _, _) { total.average_price_per_day }
  end

  field :withinCategory do
    type !TotalExpenseType
    argument :category, !types.String
    resolve ->(total, args, _) { total.within_category args[:category] }
  end

  connection :expenses, ExpenseType.connection_type
end
