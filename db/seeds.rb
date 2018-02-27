require 'fastimage'
require 'yaml'

Day.all.destroy_all # Makes it easier to correct mistakes - will remove eventually
Country.all.destroy_all
Location.all.destroy_all
Area.all.destroy_all

COUNTRIES = {
  Scotland: Country.create!(
    name: 'Scotland',
    currency_code: Currency::GBP.code
  ),
  Thailand: Country.create!(
    name: 'Thailand',
    currency_code: Currency::THB.code
  ),
  Laos: Country.create!(
    name: 'Laos',
    currency_code: Currency::LAK.code
  ),
  Cambodia: Country.create!(
    name: 'Cambodia',
    currency_code: Currency::KHR.code
  ),
  Vietnam: Country.create!(
    name: 'Vietnam',
    currency_code: Currency::VND.code
  ),
  Malaysia: Country.create!(
    name: 'Malaysia',
    currency_code: Currency::MYR.code
  )
}.freeze

AREAS = {
  Edinburgh: Area.create!(
    name: 'Edinburgh',
    country: COUNTRIES[:Scotland]
  ),
  Bangkok: Area.create!(
    name: 'Bangkok',
    country: COUNTRIES[:Thailand]
  ),
  ChiangMai: Area.create!(
    name: 'Chiang Mai',
    country: COUNTRIES[:Thailand]
  ),
  HuayXay: Area.create!(
    name: 'Huay Xay',
    country: COUNTRIES[:Laos]
  ),
  Gibbons: Area.create!(
    name: 'The Gibbon Experience',
    country: COUNTRIES[:Laos]
  ),
  LuangPrabang: Area.create!(
    name: 'Luang Prabang',
    country: COUNTRIES[:Laos]
  ),
  Trat: Area.create!(
    name: 'Trat',
    country: COUNTRIES[:Thailand]
  ),
  KohMak: Area.create!(
    name: 'Koh Mak',
    country: COUNTRIES[:Thailand]
  ),
  Kampot: Area.create!(
    name: 'Kampot',
    country: COUNTRIES[:Cambodia]
  ),
  Kep: Area.create!(
    name: 'Kep',
    country: COUNTRIES[:Cambodia]
  ),
  PhnomPenh: Area.create!(
    name: 'Phnom Penh',
    country: COUNTRIES[:Cambodia]
  ),
  Kratie: Area.create!(
    name: 'Kratie',
    country: COUNTRIES[:Cambodia]
  ),
  SiemReap: Area.create!(
    name: 'Siem Reap',
    country: COUNTRIES[:Cambodia]
  ),
  Hanoi: Area.create!(
    name: 'Hanoi',
    country: COUNTRIES[:Vietnam]
  ),
  MaiChau: Area.create!(
    name: 'Mai Chau',
    country: COUNTRIES[:Vietnam]
  ),
  CatBa: Area.create!(
    name: 'Cat Ba Island',
    country: COUNTRIES[:Vietnam]
  ),
  HoChiMinh: Area.create!(
    name: 'Ho Chi Minh City',
    country: COUNTRIES[:Vietnam]
  ),
  Penang: Area.create!(
    name: 'Penang',
    country: COUNTRIES[:Malaysia]
  ),
  CameronHighlands: Area.create!(
    name: 'Cameron Highlands',
    country: COUNTRIES[:Malaysia]
  ),
  KualaLumpur: Area.create!(
    name: 'Kuala Lumpur',
    country: COUNTRIES[:Malaysia]
  ),
  Semporna: Area.create!(
    name: 'Semporna',
    country: COUNTRIES[:Malaysia]
  )
}.freeze

LOCATIONS = {
  Edinburgh: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Our previous flat',
    latitude: 55.939031,
    longitude: -3.185759,
    area: AREAS[:Edinburgh]
  ),
  BangkokFirst: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hotel Royal Bangkok',
    latitude: 13.740658,
    longitude: 100.509889,
    area: AREAS[:Bangkok]
  ),
  ChiangMai: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Boutique House Nipha',
    latitude: 18.776539,
    longitude: 98.992413,
    area: AREAS[:ChiangMai]
  ),
  HuayXay: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Oudomsin Hotel',
    latitude: 20.275935,
    longitude: 100.413607,
    area: AREAS[:HuayXay]
  ),
  Gibbons: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Treehouse 7',
    latitude: 20.410698,
    longitude: 100.699334,
    area: AREAS[:Gibbons]
  ),
  LuangPrabang: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'SySomPhoNe Guest House',
    latitude: 19.887109,
    longitude: 102.140528,
    area: AREAS[:LuangPrabang]
  ),
  Trat: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Baan Jaidee Guesthouse',
    latitude: 12.242794,
    longitude: 102.513379,
    area: AREAS[:Trat]
  ),
  KohMak: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Prompakdee Koh Mak Resort',
    latitude: 11.825,
    longitude: 102.470107,
    area: AREAS[:KohMak]
  ),
  BangkokSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'BBHouse Khlongtan',
    latitude: 13.741263,
    longitude: 100.600572,
    area: AREAS[:Bangkok]
  ),
  Kampot: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Kampot River Bungalow',
    latitude: 10.625282,
    longitude: 104.164843,
    area: AREAS[:Kampot]
  ),
  Kep: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Visal Sak Guesthouse',
    latitude: 10.497838,
    longitude: 104.29005,
    area: AREAS[:Kep]
  ),
  PhnomPenh: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: '19 Happy House Backpacker',
    latitude: 11.569528,
    longitude: 104.92832,
    area: AREAS[:PhnomPenh]
  ),
  Kratie: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Star Backpackers Guesthouse',
    latitude: 12.484089,
    longitude: 106.017836,
    area: AREAS[:Kratie]
  ),
  SiemReapFirst: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Angkor Sweet Home',
    latitude: 13.353224,
    longitude: 103.861932,
    area: AREAS[:SiemReap]
  ),
  SiemReapSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Panda Angkor Inn',
    latitude: 13.34802,
    longitude: 103.845565,
    area: AREAS[:SiemReap]
  ),
  HanoiFirst: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hanoi Zesty',
    latitude: 21.033917,
    longitude: 105.848751,
    area: AREAS[:Hanoi]
  ),
  MaiChau: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Mai Chau Sunrise Village',
    latitude: 20.653927,
    longitude: 105.066922,
    area: AREAS[:MaiChau]
  ),
  HanoiSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Camellia 5 Hotel',
    latitude: 21.035408,
    longitude: 105.848992,
    area: AREAS[:Hanoi]
  ),
  CatBa: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Victor Charlie Hostel',
    latitude: 20.726301,
    longitude: 107.050335,
    area: AREAS[:CatBa]
  ),
  HoChiMinh: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Ngoc Phu Hotel',
    latitude: 10.766031,
    longitude: 106.691628,
    area: AREAS[:HoChiMinh]
  ),
  Penang: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Cookobird Home',
    latitude: 5.415603,
    longitude: 100.33782,
    area: AREAS[:Penang]
  ),
  CameronHighlands: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'R&R Budget Inn',
    latitude: 4.472587,
    longitude: 101.37352,
    area: AREAS[:CameronHighlands]
  ),
  KualaLumpur: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'The Bodhi Lodge',
    latitude: 3.1294,
    longitude: 101.679549,
    area: AREAS[:KualaLumpur]
  ),
  Semporna: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Awys Backpackers',
    latitude: 4.478397,
    longitude: 118.61022,
    area: AREAS[:Semporna]
  )
}.freeze

def create_day(config)
  day = Day.find_or_create_by!(number: config[:number], date: config[:date])
  create_post(day, config[:entry], config[:written])
  create_expenses(day, config[:expenses])
  create_photos(day, config[:photos])
  link_locations(day, config[:locations])
end

def create_post(day, content, written_at)
  Post.find_or_create_by! day: day, content: content, written_at: Time.parse(written_at)
end

def create_expenses(day, expenses_by_category)
  expenses_by_category.each do |category, expenses|
    create_expenses_for_category(day, category.to_s, expenses) if expenses.any?
  end
end

def create_expenses_for_category(day, category, expenses)
  if price?(expenses)
    create_expense day: day, description: nil, price: expenses, category: category
  else
    expenses.each do |description, price|
      create_expense day: day, description: description, price: price, category: category
    end
  end
end

CURRENCY_NAMES_TO_CODES = Currency::ALL.each_with_object({}) do |currency, result|
  result[currency.name.to_sym] = currency.code.to_s
end

def price?(hash)
  hash.size == 1 && CURRENCY_NAMES_TO_CODES.keys.include?(hash.keys.first)
end

def create_expense(day:, description:, price:, category:)
  Expense.find_or_create_by!(
    day: day,
    description: description,
    amount: price.values.first,
    currency_code: CURRENCY_NAMES_TO_CODES[price.keys.first],
    category: category
  )
end

def link_locations(day, location_symbols)
  day.locations << location_symbols.map { |symbol| LOCATIONS[symbol] }
end

def create_photos(day, photos)
  return if photos.blank?
  photos.each { |photo| create_photo(day, photo) }
end

def create_photo(day, photo_config)
  return if photo_config.blank?
  photo_config = { url: photo_config } unless photo_config.is_a?(Hash)
  return if photo_config[:url].blank?
  dimensions = FastImage.size(photo_config[:url])
  photo_config[:width] = dimensions.first
  photo_config[:height] = dimensions.second
  day.photos.create photo_config
end

Dir[Rails.root.join('db', 'data', '*')]
  .map { |file| YAML.load_file file }
  .each &method(:create_day)


