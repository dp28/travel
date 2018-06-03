require 'yaml'

def load_days
  puts 'Loading day files ...'
  Dir[Rails.root.join('db', 'data', '*')]
    .sort
    .map(&method(:parse_day_file))
end

def parse_day_file(file_name)
  YAML.load_file(file_name).tap do |day|
    if day.to_s.include? 'FILL_THIS_IN'
      raise "Day #{day[:number]} has incomplete information (found 'FILL_THIS_IN')"
    end
  end
end

DAYS = load_days

puts 'Clearing the database...'
Day.all.destroy_all # Makes it easier to correct mistakes - will remove eventually
Country.all.destroy_all
Location.all.destroy_all
Area.all.destroy_all
Food.all.destroy_all

puts 'Creating countries...'
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
  ),
  Singapore: Country.create!(
    name: 'Singapore',
    currency_code: Currency::SGD.code
  ),
  Indonesia: Country.create!(
    name: 'Indonesia',
    currency_code: Currency::IDR.code
  ),
  Australia: Country.create!(
    name: 'Australia',
    currency_code: Currency::AUD.code
  ),
  Argentina: Country.create!(
    name: 'Argentina',
    currency_code: Currency::ARS.code
  ),
  Chile: Country.create!(
    name: 'Chile',
    currency_code: Currency::CLP.code
  ),
  Bolivia: Country.create!(
    name: 'Bolivia',
    currency_code: Currency::CLP.code
  ),
  Peru: Country.create!(
    name: 'Peru',
    currency_code: Currency::PEN.code
  )
}.freeze

puts 'Creating areas...'
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
  ),
  Sandakan: Area.create!(
    name: 'Sandakan',
    country: COUNTRIES[:Malaysia]
  ),
  TamanNegara: Area.create!(
    name: 'Taman Negara',
    country: COUNTRIES[:Malaysia]
  ),
  Singapore: Area.create!(
    name: 'Singapore',
    country: COUNTRIES[:Singapore]
  ),
  Lombok: Area.create!(
    name: 'Lombok',
    country: COUNTRIES[:Indonesia]
  ),
  Bali: Area.create!(
    name: 'Bali',
    country: COUNTRIES[:Indonesia]
  ),
  Flores: Area.create!(
    name: 'Flores',
    country: COUNTRIES[:Indonesia]
  ),
  Gili: Area.create!(
    name: 'Gili',
    country: COUNTRIES[:Indonesia]
  ),
  Sydney: Area.create!(
    name: 'Sydney',
    country: COUNTRIES[:Australia]
  ),
  BuenosAires: Area.create!(
    name: 'Buenos Aires',
    country: COUNTRIES[:Argentina]
  ),
  Mendoza: Area.create!(
    name: 'Mendoza',
    country: COUNTRIES[:Argentina]
  ),
  Santiago: Area.create!(
    name: 'Santiago',
    country: COUNTRIES[:Chile]
  ),
  Valparaiso: Area.create!(
    name: 'Valparaiso',
    country: COUNTRIES[:Chile]
  ),
  Atacama: Area.create!(
    name: 'Atacama desert',
    country: COUNTRIES[:Chile]
  ),
  VillaMar: Area.create!(
    name: 'Villa Mar',
    country: COUNTRIES[:Bolivia]
  ),
  SaltFlats: Area.create!(
    name: 'Uyuni salt flats',
    country: COUNTRIES[:Bolivia]
  ),
  Uyuni: Area.create!(
    name: 'Uyuni',
    country: COUNTRIES[:Bolivia]
  ),
  Sucre: Area.create!(
    name: 'Sucre',
    country: COUNTRIES[:Bolivia]
  ),
  SantaCruz: Area.create!(
    name: 'Santa Cruz',
    country: COUNTRIES[:Bolivia]
  ),
  LaPaz: Area.create!(
    name: 'La Paz',
    country: COUNTRIES[:Bolivia]
  ),
  Copacabana: Area.create!(
    name: 'Copacabana',
    country: COUNTRIES[:Bolivia]
  ),
  Puno: Area.create!(
    name: 'Puno',
    country: COUNTRIES[:Peru]
  ),
  Arequipa: Area.create!(
    name: 'Arequipa',
    country: COUNTRIES[:Peru]
  ),
  Cusco: Area.create!(
    name: 'Cusco',
    country: COUNTRIES[:Peru]
  ),
  Soraypampa: Area.create!(
    name: 'Soraypampa',
    country: COUNTRIES[:Peru]
  ),
  Colcapampa: Area.create!(
    name: 'Colcapampa',
    country: COUNTRIES[:Peru]
  ),
  LaPlaya: Area.create!(
    name: 'La Playa',
    country: COUNTRIES[:Peru]
  ),
  MachuPicchu: Area.create!(
    name: 'Machu Picchu',
    country: COUNTRIES[:Peru]
  ),
  Nazca: Area.create!(
    name: 'Nazca',
    country: COUNTRIES[:Peru]
  ),
  Lima: Area.create!(
    name: 'Lima',
    country: COUNTRIES[:Peru]
  ),
  Huaraz: Area.create!(
    name: 'Huaraz',
    country: COUNTRIES[:Peru]
  ),
  Paria: Area.create!(
    name: 'Paria',
    country: COUNTRIES[:Peru]
  ),
  Taullipampa: Area.create!(
    name: 'Taullipampa',
    country: COUNTRIES[:Peru]
  ),
  Llamacorral: Area.create!(
    name: 'Llamacorral',
    country: COUNTRIES[:Peru]
  )
}.freeze

puts 'Creating locations...'
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
  KualaLumpurSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Raizzy\'s Guest House',
    latitude: 3.143188,
    longitude: 101.69647,
    area: AREAS[:KualaLumpur]
  ),
  KualaLumpurThird: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Euro Life Hotel',
    latitude: 3.13195,
    longitude: 101.687865,
    area: AREAS[:KualaLumpur]
  ),
  Semporna: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Awys Backpackers',
    latitude: 4.478397,
    longitude: 118.61022,
    area: AREAS[:Semporna]
  ),
  Sandakan: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Harbourside Backpackers',
    latitude: 5.839215,
    longitude: 118.11963,
    area: AREAS[:Sandakan]
  ),
  TamanNegara: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Fatehah Inn',
    latitude: 4.382994,
    longitude: 102.403846,
    area: AREAS[:TamanNegara]
  ),
  Singapore: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Santa Grand Hotel Little India',
    latitude: 1.307732,
    longitude: 103.853054,
    area: AREAS[:Singapore]
  ),
  Lombok: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Kuta Lodge Homestay',
    latitude: -8.885301,
    longitude: 116.278112,
    area: AREAS[:Lombok]
  ),
  Bali: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: "Denise's house",
    latitude: -8.502663,
    longitude: 115.26914,
    area: AREAS[:Bali]
  ),
  BaliSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Pondok Mimba',
    latitude: -8.538427,
    longitude: 115.504396,
    area: AREAS[:Bali]
  ),
  Flores: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hotel Kasuwari',
    latitude: -8.499457,
    longitude: 119.883976,
    area: AREAS[:Flores]
  ),
  Gili: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Putri Home Stay',
    latitude: -8.352181,
    longitude: 116.05728,
    area: AREAS[:Gili]
  ),
  GiliSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'ii Bungalow',
    latitude: -8.353573,
    longitude: 116.060538,
    area: AREAS[:Gili]
  ),
  Sydney: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Airbnb',
    latitude: -33.890417,
    longitude: 151.19522,
    area: AREAS[:Sydney]
  ),
  BuenosAires: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hotel Boutique Bonito Buenos Aires',
    latitude: -34.616654,
    longitude: -58.387578,
    area: AREAS[:BuenosAires]
  ),
  Mendoza: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hostel Estacion Mendoza',
    latitude: -32.897173,
    longitude: -68.840075,
    area: AREAS[:Mendoza]
  ),
  Santiago: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Shared apartment',
    latitude: -33.447338,
    longitude: -70.635695,
    area: AREAS[:Santiago]
  ),
  SantiagoSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'CasaSur Charming Hotel',
    latitude: -33.447833,
    longitude: -70.629255,
    area: AREAS[:Santiago]
  ),
  Valparaiso: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hotel Boutique 17',
    latitude: -33.041894,
    longitude: -71.626433,
    area: AREAS[:Valparaiso]
  ),
  Atacama: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hostal Pueblo de Tierra',
    latitude: -22.909497,
    longitude: -68.195061,
    area: AREAS[:Atacama]
  ),
  AtacamaSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Altiplanico Atacama',
    latitude: -22.904205,
    longitude: -68.205377,
    area: AREAS[:Atacama]
  ),
  AtacamaThird: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Toconao 648',
    latitude: -22.916321,
    longitude: -68.199071,
    area: AREAS[:Atacama]
  ),
  VillaMar: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Villa Mar',
    latitude: -21.756447,
    longitude: -67.480899,
    area: AREAS[:VillaMar]
  ),
  SaltHotel: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Salt Hotel (Guessed location)',
    latitude: -20.911945,
    longitude: -67.566671,
    area: AREAS[:SaltFlats]
  ),
  Uyuni: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Uyuni bus office',
    latitude: -20.460873,
    longitude: -66.826226,
    area: AREAS[:Uyuni]
  ),
  Sucre: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Family Hostel',
    latitude: -19.043193,
    longitude: -65.263635,
    area: AREAS[:Sucre]
  ),
  SantaCruz: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Residencial Ikandire II',
    latitude: -17.775915,
    longitude: -63.174975,
    area: AREAS[:SantaCruz]
  ),
  LaPaz: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Casa Skyways B&B',
    latitude: -16.512846,
    longitude: -68.125695,
    area: AREAS[:LaPaz]
  ),
  Copacabana: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hostal Puerto Alegre',
    latitude: -16.167429,
    longitude: -69.08524,
    area: AREAS[:Copacabana]
  ),
  Puno: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Ururi Stay Puno',
    latitude: -15.838337,
    longitude: -70.0281,
    area: AREAS[:Puno]
  ),
  Arequipa: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Yes Arequipa Hostel',
    latitude: -16.400837,
    longitude: -71.541574,
    area: AREAS[:Arequipa]
  ),
  Cusco: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Barrio Inka',
    latitude: -13.517419,
    longitude: -71.986444,
    area: AREAS[:Cusco]
  ),
  CuscoSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Hostal 512391',
    latitude: -13.517419,
    longitude: -71.983813,
    area: AREAS[:Cusco]
  ),
  Soraypampa: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Soraypampa',
    latitude: -13.391586,
    longitude: -72.574476,
    area: AREAS[:Soraypampa]
  ),
  Colcapampa: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Colcapampa',
    latitude: -13.31823,
    longitude: -72.669405,
    area: AREAS[:Colcapampa]
  ),
  LaPlaya: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'La Playa',
    latitude: -13.233895,
    longitude: -72.632143,
    area: AREAS[:LaPlaya]
  ),
  MachuPicchu: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Machu Picchu',
    latitude: -13.154377,
    longitude: -72.527057,
    area: AREAS[:MachuPicchu]
  ),
  MachuPicchuSecond: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Sol de Oro Hostel',
    latitude: -13.156156,
    longitude: -72.523039,
    area: AREAS[:MachuPicchu]
  ),
  Nazca: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Cruz del Sur bus station',
    latitude: -14.828343,
    longitude: -74.942874,
    area: AREAS[:Nazca]
  ),
  Lima: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Zig Zag Hostel',
    latitude: -12.110665,
    longitude: -77.031785,
    area: AREAS[:Lima]
  ),
  Huaraz: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Alojamiento Huaraz',
    latitude: -9.5276,
    longitude: -77.522557,
    area: AREAS[:Huaraz]
  ),
  Paria: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Paria',
    latitude: -8.951421,
    longitude: -77.562607,
    area: AREAS[:Paria]
  ),
  Taullipampa: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Taullipampa',
    latitude: -8.918329,
    longitude: -77.60483,
    area: AREAS[:Taullipampa]
  ),
  Llamacorral: Location.create!(
    type: Location::Type::ACCOMMODATION,
    name: 'Llamacorral',
    latitude: -8.945963,
    longitude: -77.701644,
    area: AREAS[:Llamacorral]
  )
}.freeze

def create_day(config)
  day = Day.find_or_create_by!(number: config[:number], date: config[:date])
  create_post(day, config[:entry], config[:written])
  create_sub_models(day, config)
  link_locations(day, config)
  print "#{config[:number]} . "
end

def create_sub_models(day, config)
  create_expenses(day, config[:expenses])
  create_photos(day, config[:photos])
  create_meals(day, config[:food])
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
  result[currency.name.parameterize(separator: '_').to_sym] = currency.code.to_s
end

def price?(hash)
  hash.size == 1 && CURRENCY_NAMES_TO_CODES.keys.include?(hash.keys.first)
end

def create_expense(day:, description:, price:, category:)
  return if category.to_sym == :INTERCONTINENTAL_FLIGHTS
  Expense.find_or_create_by!(
    day: day,
    description: description,
    amount: price.values.first,
    currency_code: CURRENCY_NAMES_TO_CODES[price.keys.first],
    category: category
  )
end

def link_locations(day, config)
  day.locations << config[:locations].map { |symbol| LOCATIONS[symbol] }
  create_accommodation(day, config[:accommodation])
end

def create_photos(day, photos)
  return if photos.blank?
  photos.each { |photo| create_photo(day, photo) }
end

def create_photo(day, photo_config)
  return if photo_config.blank? || photo_config[:url].blank?
  unless photo_config[:width]
    raise "Photo missing dimensions - run rails data:update_images .URL: #{photo_config[:url]}"
  end
  day.photos.create photo_config
end

def create_accommodation(day, accommodation_location_name)
  day.create_accommodation! location: LOCATIONS[accommodation_location_name]
end

def create_meals(day, meals_config)
  meals_config.each_with_index do |meal_config, ordering|
    create_meal(day, meal_config, ordering)
  end
end

def create_meal(day, meal_config, ordering)
  food_names = meal_config.split(',').map { |f| f.strip.downcase.singularize }.reject(&:blank?)
  foods = food_names.map { |name| Food.find_or_create_by! name: name }
  meal = day.meals.create! ordering: ordering
  meal.foods << foods
end

puts 'Creating days...'
DAYS.each(&method(:create_day))

puts '... done.'
