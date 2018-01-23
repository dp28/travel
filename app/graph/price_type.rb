PriceType = GraphQL::ObjectType.define do
  name 'Price'
  description 'A price in a particular Currency'

  field :amount, !types.Float
  field :currency, !CurrencyType

  field :convertTo do
    type PriceType
    argument :code, types.String
    resolve lambda { |currency_amount, args, _|
      currency = Currency.find_by_code args[:code]
      if currency
        currency_amount.convert_to currency
      else
        GraphQL::ExecutionError.new "No Currency found for code '#{args[:code]}'"
      end
    }
  end
end
