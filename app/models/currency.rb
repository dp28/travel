# Does not extend ApplicationModel as not stored in database
class Currency

  attr_reader :code, :name, :symbol, :exchange_rate_to_dollars

  def initialize(code:, name:, symbol:, exchange_rate_to_dollars:)
    @code = code.to_sym
    @name = name
    @symbol = symbol
    @exchange_rate_to_dollars = exchange_rate_to_dollars
  end

  USD = Currency.new(
    code: :USD,
    name: 'dollars',
    symbol: '$',
    exchange_rate_to_dollars: 1.0
  )

  GBP = Currency.new(
    code: :GBP,
    name: 'pounds',
    symbol: '£',
    exchange_rate_to_dollars: 1.34670
  )

  THB = Currency.new(
    code: :THB,
    name: 'baht',
    symbol: '฿',
    exchange_rate_to_dollars: 0.0312192
  )

  VND = Currency.new(
    code: :VND,
    name: 'dong',
    symbol: '₫',
    exchange_rate_to_dollars: 0.0000440622
  )

  LAK = Currency.new(
    code: :LAK,
    name: 'kip',
    symbol: '₭',
    exchange_rate_to_dollars: 0.00012
  )

  KHR = Currency.new(
    code: :KHR,
    name: 'riel',
    symbol: '៛',
    exchange_rate_to_dollars: 0.00025
  )

  ALL = [USD, GBP, THB, VND, LAK, KHR].freeze
  DEFAULT = USD

  def self.find_by_code(code)
    code_sym = code.to_sym
    ALL.detect { |currency| currency.code == code_sym }
  end

end
