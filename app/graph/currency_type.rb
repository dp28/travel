CurrencyType = GraphQL::ObjectType.define do
  name 'Currency'
  description 'A Currency used during the trip, pegged at the exhange rate then'

  field :code, !types.String
  field :name, !types.String
  field :symbol, !types.String
end
