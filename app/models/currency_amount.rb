# Does not extend ApplicationModel as not stored in database
class CurrencyAmount

  attr_reader :currency, :amount

  def initialize(currency:, amount:)
    @currency = currency
    @amount = amount
  end

  def convert_to(new_currency)
    amount_in_dollars = amount * currency.exchange_rate_to_dollars
    new_amount = amount_in_dollars / new_currency.exchange_rate_to_dollars
    CurrencyAmount.new currency: new_currency, amount: round(new_amount)
  end

private

  def round(number, significant_figures: 3)
    scientific_notation = format("%.#{significant_figures - 1}e", number)
    scientific_notation.to_f
  end

end
