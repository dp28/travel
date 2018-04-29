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

  MYR = Currency.new(
    code: :MYR,
    name: 'ringgit',
    symbol: 'RM',
    exchange_rate_to_dollars: 0.2551
  )

  SGD = Currency.new(
    code: :SGD,
    name: 'Singapore dollars',
    symbol: 'S$',
    exchange_rate_to_dollars: 0.759529
  )

  IDR = Currency.new(
    code: :IDR,
    name: 'rupiah',
    symbol: 'Rp',
    exchange_rate_to_dollars: 0.0000726904
  )

  AUD = Currency.new(
    code: :AUD,
    name: 'Australian dollars',
    symbol: 'A$',
    exchange_rate_to_dollars: 0.768527
  )

  ARS = Currency.new(
    code: :ARS,
    name: 'Argentinian pesos',
    symbol: 'ARS $',
    exchange_rate_to_dollars: 0.0496560
  )

  CLP = Currency.new(
    code: :CLP,
    name: 'Chilean pesos',
    symbol: 'CLP $',
    exchange_rate_to_dollars: 0.00167581
  )

  BOB = Currency.new(
    code: :BOB,
    name: 'Bolivianos',
    symbol: 'B$',
    exchange_rate_to_dollars: 0.144196
  )

  ALL = [USD, GBP, THB, VND, LAK, KHR, MYR, SGD, IDR, AUD, ARS, CLP, BOB].freeze
  DEFAULT = USD

  def self.find_by_code(code)
    code_sym = code.to_sym
    ALL.detect { |currency| currency.code == code_sym }
  end

end
