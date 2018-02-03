Day.all.destroy_all # Makes it easier to correct mistakes - will remove eventually
Country.all.destroy_all
Location.all.destroy_all

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
  )
}.freeze

LOCATIONS = {
  Edinburgh: Location.create!(
    place_name: 'Edinburgh',
    accommodation: 'Our previous flat',
    latitude: 55.939031,
    longitude: -3.185759,
    country: COUNTRIES[:Scotland]
  ),
  BangkokFirst: Location.create!(
    place_name: 'Bangkok',
    accommodation: 'Hotel Royal Bangkok',
    latitude: 13.740658,
    longitude: 100.509889,
    country: COUNTRIES[:Thailand]
  ),
  ChiangMai: Location.create!(
    place_name: 'Chiang Mai',
    accommodation: 'Boutique House Nipha',
    latitude: 18.776539,
    longitude: 98.992413,
    country: COUNTRIES[:Thailand]
  ),
  HuayXay: Location.create!(
    place_name: 'Huay Xay',
    accommodation: 'Oudomsin Hotel',
    latitude: 20.275935,
    longitude: 100.413607,
    country: COUNTRIES[:Laos]
  ),
  Gibbons: Location.create!(
    place_name: 'The Gibbon Experience',
    accommodation: 'Treehouse 7',
    latitude: 20.410698,
    longitude: 100.699334,
    country: COUNTRIES[:Laos]
  ),
  LuangPrabang: Location.create!(
    place_name: 'Luang Prabang',
    accommodation: 'SySomPhoNe Guest House',
    latitude: 19.887109,
    longitude: 102.140528,
    country: COUNTRIES[:Laos]
  ),
  Trat: Location.create!(
    place_name: 'Trat',
    accommodation: 'Baan Jaidee Guesthouse',
    latitude: 12.242794,
    longitude: 102.513379,
    country: COUNTRIES[:Thailand]
  ),
  KohMak: Location.create!(
    place_name: 'Koh Mak',
    accommodation: 'Prompakdee Koh Mak Resort',
    latitude: 11.825,
    longitude: 102.470107,
    country: COUNTRIES[:Thailand]
  ),
  BangkokSecond: Location.create!(
    place_name: 'Bangkok',
    accommodation: 'BBHouse Khlongtan',
    latitude: 13.741263,
    longitude: 100.600572,
    country: COUNTRIES[:Thailand]
  ),
  Kampot: Location.create!(
    place_name: 'Kampot',
    accommodation: 'Kampot River Bungalow',
    latitude: 10.625282,
    longitude: 104.164843,
    country: COUNTRIES[:Cambodia]
  ),
  Kep: Location.create!(
    place_name: 'Kep',
    accommodation: 'Visal Sak Guesthouse',
    latitude: 10.497838,
    longitude: 104.29005,
    country: COUNTRIES[:Cambodia]
  ),
  PhnomPenh: Location.create!(
    place_name: 'Phnom Penh',
    accommodation: '19 Happy House Backpacker',
    latitude: 11.569528,
    longitude: 104.92832,
    country: COUNTRIES[:Cambodia]
  ),
  Kratie: Location.create!(
    place_name: 'Kratie',
    accommodation: 'Star Backpackers Guesthouse',
    latitude: 12.484089,
    longitude: 106.017836,
    country: COUNTRIES[:Cambodia]
  )
}.freeze

DAYS = [
  {
    date: '2018-01-04',
    number: 1,
    written: '2018-01-08 20:00',
    locations: [LOCATIONS[:Edinburgh]],
    expenses: {
      FOOD: {},
      ACCOMMODATION: {},
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: {},
      OTHER: {}
    },
    food: [
      'porridge',
      'lamb tagine, bread, yoghurt & oil, mango lassi'
    ],
    books: {
      reading: {
        started: {
          title: 'Down and out in South East Asia',
          author: 'Alex Watts'
        }
      }
    },
    entry: %(
So, better write this down before I forget it all. I started in Edinburgh,
finishing moving out of my flat by shoving the last few things into my parents'
car (with their help). We managed to squeeze into the jam-packed car to go and
say goodbye to my granny before heading to the airport.

We arrived with over two hours to spare - plenty of time. I tried to check in my
bag through the automated machines (human contact? Not for this software
developer), but it wasn't having any of it. I managed to check in at the manned
desk, but apparently could only get my boarding pass for my first of three
flights (to Manchester). My bag, however, was given passage all the way to
Bangkok.

The flight to Manchester was fine and I was told that I'd be able to pick up my
remaining boarding passes at the gate for my next flight. I passed a couple of
hours programming in a restaurant (chosen because it had a few plug sockets) and
eating a surprisingly good lamb tagine.

When my gate was announced, I packed up, found the gate, and asked the staff for
my boarding cards. They found them and were about to hand them over when one
asked to see my ticket for my onwards journey from Thailand, apparently
necessary before being let into the country. Cue a look of _hopefully_ mild
confusion while my stomach lurches - Rosie and I were planning to leave Thailand
by bus which can only be booked in person in Chiang Mai. Damn.

One of the members of staff recommended a website to book cheap bus tickets, but
it only covered Cambodia. Improvising, I tried to look for flights from Chiang
Mai to Luang Prabang in Laos, near to the next stop on our itinerary. The
airport wifi suddenly seemed so much slower as soon as I needed it to work.
Luckily, Rosie phoned to check how the first leg of my journey was going and I
told her what had happened. Because both my internet connection and the queue to
board the plane was dwindling to nothing, Rosie found and booked both of us on a
flight to Luang Prabang. Unfortunately, there weren't many left and we would
have to fly through Bangkok. Worse, the confirmation email was just a proof of
purchase, not a booking. The booking email would be sent "within the next four
hours". Great.

Thankfully, the airline officials accepted the proof of purchase email. I was
the last to get on the plane and my heart rate returned to normal. I sat back,
relaxed, watched some crappy superhero movie until the in-air entertainment
system failed and I managed to get some sleep (thank you, travel pillow).

<R> Meanwhile in California I received a rather panicked phone call from Daniel
informing me that he needed to prove onward travel from Thailand or they wouldn't
let him on the plane! I quickly tried to book the flight that Dan had told me to
first trying the airline website only to be told that was only one seat, well that
was no good, we needed two... I tried a booking site for the same flight and it went
through or at least they sent us a confirmation email, Dan made it on the plane.

Panic over, crisis averted... not so fast. I logged into the booking site in the car
on the way to LA and found that the tickets hadn't been issued there was in fact only
one seat, I was unimpressed. This now left me stuck I didn't have any proof of onwards
travel and besides we were going to be flying back into Thailand from Laos, would we
need to prove onward travel then, would one ticket do both jobs. I hoped so and booked
a flight from Thailand to Cambodia from Bangkok air, or at least I thought I did, the
credit card didn't go through. So I called them, they don't accept card payments over
the phone, I would need to fax them my credit card (what?!) I tried another booking site,
although I will admit I was skeptical of them at this point, and this one worked. Or at
least I was issued both a ticket and they charged my card. I then proceeded to have a
lovely lunch in LA followed by a visit to the very cool Getty art gallery and then
an equally lovely dinner before heading to LAX.

At LAX they didn't seem fussed about onward travel although they only issued my
ticket as far as China which I will admit concerned me. After standing in 4 very long queues
I made it onto the plane, watched Goodbye Christopher Robin and fell asleep for
most of the remaining 10 hours. I was a little bit fed up with airline booking
sites at this point. </R>
)
  },
  {
    date: '2018-01-05',
    number: 2,
    written: '2018-01-08 20:00',
    locations: [LOCATIONS[:BangkokFirst]],
    expenses: {
      FOOD: { bananas: { baht: 50 } },
      ACCOMMODATION: { baht: 1888 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { train: { baht: 40 }, taxi: { baht: 250 } },
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 4.7,
      temperature: 30,
      altitude: 1
    },
    food: [
      'two bananas'
    ],
    entry: %(
I woke up feeling slightly worse than when I went to sleep, as expected from
plane sleep. Once I'm off the plane I connected to the wifi to check that
nothing else had gone wrong. Getting stuck in Manchester would have been
frustrating, but in Abu Dhabi it'd have been down right awkward. Once connected,
a stream of messages popped up. Uh oh. The last-minute flight was never booked,
there weren't enough places, so it was canceled. Didn't they know that
when we booked? Terrible user experience. Bad software design was quite possibly
the cause. But most importantly, it once again left me without a ticket out of
Thailand.

Rosie to the rescue again! She booked a flight from Bangkok to Phnom Penh, a
week and a half later. That was a much better idea than my rushed earlier
attempt. We were planning to return to Thailand later and would have to have
another proof of exit; that flight could be used as proof of exit both times.

After another flight with a bad superhero movie and worse sleep, I made it to
Bangkok. I got my luggage, found the train into the city and got off near the
centre. After half an hour of wandering around I figured the connecting train
shown on Google Maps at the airport may no longer exist. Admittedly, there had
been a warning saying that the schedule may be out of date.

I wasn't totally sure just how far it would be to walk to my hotel and may have
been a _little_ intimidated by the idea of trying to cross the incredibly busy
roads. When a taxi stopped, I told him where I was going and accepted the
rip-off fare because I really just wanted to get some decent sleep. I got to the
hotel, checked in, messaged home and Rosie to say I'd made it, then went to
sleep.

<R> Meanwhile in China, I landed, stood in a queue to be allowed into the terminal,
and then stood in a immigration queue followed by a customs queue. I then tried to
figure out how to get from arrivals to departures (there is one lift that makes the
journey), stood in a queue to get my ticket issued, proved onward travel and was
handed a ticket to Thailand (yes!). I then stood in a queue to leave through immigration
and another to get through security and finally one to get on the plane. China seems
to really like getting people to queue up. </R>

)
  },
  {
    date: '2018-01-06',
    number: 3,
    written: '2018-01-08 20:00',
    locations: [LOCATIONS[:BangkokFirst]],
    expenses: {
      FOOD: { lollies: { baht: 100 }, dinner: { baht: 195 }, cocktails: { baht: 240 } },
      ACCOMMODATION: { baht: 1888 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { train: { baht: 40 }, taxi: { baht: 250 } },
      ACTIVITIES: { museum: { baht: 400 } },
      OTHER: {}
    },
    stats: {
      walked: 6,
      temperature: 32,
      altitude: 1
    },
    food: [
      'Hotel breakfast (corn flakes, pastries, strawberry jam, orange juice)',
      'two bits of shortbread',
      'Mango ice cream with weird coconut coating',
      'Street food (Duck spring rolls, deep fried veggie spring rolls, deep fried noodles, sweet chilli sauce, mushrooms & asparagus wrapped in bacon and fried)'
    ],
    entry: %(
I woke up at 4am Bangkok time, 11am UK time. That was probably jet lag. I've yet
to experience jet lag particularly badly - I just rolled over, went back to
sleep and woke up again six hours later.

Our booking included breakfast, so I helped myself to pastries, jam, orange
juice and a bowl of cornflakes. The milk was definitely UHT but I happen to
think that one of the two ways UHT milk tastes good is on cornflakes (the other,
obviously, being drunk straight from the 5ml plastic containers that are
_possibly_ intended to be used for take away tea & coffee).

I spent the next couple of hours reading the Bangkok section of our guidebook
and a bit of the cookery-slanted South East Asia travel book I was reading.
Rosie arrived in the early afternoon, dumped her stuff, showered, and we headed
out into Bangkok. <R> My stuff was delicately placed not dumped. </R>

To get a bit of background on Thailand, we went to the guidebook-recommended
Museum of Siam. The museum was primarily focused on trying to determine "What
is Thainess", highlighting the importance of the nation, religion and monarchy
to its people. The exhibits in each of the 17 rooms were different in style,
quite interactive and (mostly) in English. For me, the best and strangest room
was the one trying to determine how Thai certain outfits were by ranking them in
a pyramid formation. Some of these seemed clear after earlier parts of the
museum, such as Rama being the most Thai and formal Thai costume being fairly
high up. But what are "Bike for Mom" and "Bike for Dad" t-shirts and why are
they even higher? I'm pretty sure I'd never see a similar display in a British
museum - I doubt there is a politically-correct way to determine how British
something is, especially in Scotland or Northern Ireland.

Afterwards, we made our way back to our hotel, the Hotel Royal Bangkok. It was
on one of the main streets of Chinatown, blazing with the neon glow from the
multitude of signs. It turned out our hotel was bang in the centre of the street
food stalls in Chinatown, making it perfect for dinner. We wandered around to
choose a few, settling on shredded duck rolls, deep-fried vegetable spring
rolls and surprisingly good deep-fried noodles & sweet chilli dip. We also got
got several things from a man frying small bundles of food wrapped in bacon and
served on cocktail sticks, mainly different types of mushrooms but also some
tasty asparagus.

We finished the day with a cocktail each in the rooftop bar of our hotel.
Apparently it was a pool party but everyone seemed to be ignoring both the pool
and the blaring music. The night skyline of Bangkok, however, was spectacular.

![Day 1 in Bangkok](https://lh3.googleusercontent.com/IkR8dNFlOT49EitQNCDEBvRwHx3YI-0w3uSBxfXeGYnFxkZZNIHq5l7iDKBPnMFSe9qX7PagBjowisXrzbWCn0ykT1a0LMjgNsQbU7G6s-g3ipEgUFJzDHdkk1BaGh2N3Z8HHFjjYn8)
)
  },
  {
    date: '2018-01-07',
    number: 4,
    written: '2018-01-08 20:00',
    locations: [LOCATIONS[:BangkokFirst]],
    expenses: {
      FOOD: { water: { baht: 34 }, dinner: { baht: 200 } },
      ACCOMMODATION: { baht: 1888 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { skytrain: { baht: 86 }, tuk_tuk: { baht: 350 }, subway: { baht: 160 } },
      ACTIVITIES: { palace: { baht: 1000 }, wat_pho: { baht: 200 } },
      OTHER: {}
    },
    stats: {
      walked: 9.9,
      temperature: 31,
      altitude: 1
    },
    food: [
      'hotel breakfast (cornflakes, pineapple, pineapple juice, egg fried rice, pork stew, chicken stew, chilli sauce)',
      'MBK lunch',
      'Street food dinner (deep fried veggie spring rolls, deep fried noodles, sweet chilli sauce, mushrooms & asparagus wrapped in bacon and fried'
    ],
    entry: %(
To try and capitalise on our (Rosie's) jet lag, we got up at 6.45am to get out
early. Unfortunately, we lost a bit of time booking the train for Chiang Mai the
next day, but then went down to breakfast. I tried out some of the Thai food on
offer - rice and several stews with some chilli sauce.

Today was our day for seeing some of the main recommended sights of Bangkok -
the Grand Palace and Wat Pho. The Grand Palace is a former residence of the Thai
monarchy and also houses the Emerald Buddha (which isn't made from emerald). The
palace complex is huge and the buildings are incredibly ornate and covered in
gold. For me, the most interesting (and least crowded) parts were Chakri
Mahaprasat - a Western-style building with a Thai roof - and a smaller museum of
items donated to the Buddha, which includes models of what the complex looked
like when it was built in 1782 and what it is like now. <R> They seem to really
really like gold and they cover **everything** in it, you would need sunglasses
even on a shady day, </R>

We then went to Wat Pho, a temple with a huge reclining Buddha, more intricate
decorations and a functioning primary school. It was recommended more than the
Grand Palace primarily for its impressive Buddha and smaller crowds, but the
significantly cheaper entry price and free water were greatly appreciated.

We haggled our way onto a tuk tuk to Siam Square and bought lunch at the food
court in the huge MBK centre. From there, we caught the Skytrain (similar to
the subway, but built at a level **above** the cars) to Chatuchak weekend
market. The market was _huge_, a maze of stalls selling anything and
everything, from a plethora of tourist tat to pet cats.

Somewhat overwhelmed and overheated, we settled down by a lake in an adjacent
park to relax for a bit. We were fascinated and somewhat revolted by the size of
the catfish which fought over the food being thrown into the lake by people near
by. <R> There was also a turtle </R> After a while, we made our way back to the
hotel on the subway. We finished off the night with street food and chilling in the rooftop bar.

![Bangkok Day 2](https://lh3.googleusercontent.com/0yfzNcsYf1vmCSsG2syPeEmcEo-9cewTl3KxX1indKozkgmdZD_Q2bn-VCsJnn8FpCvJ9lR5Y_ZbwTTi1eO_UqWtUtiyrWwXSbShnATVQVpkykWua3kY3XGRCI8v1eUo9P7C1VTnDJo)
)
  },
  {
    date: '2018-01-08',
    number: 5,
    written: '2018-01-08 20:00',
    locations: [LOCATIONS[:BangkokFirst]],
    expenses: {
      FOOD: { lunch: { baht: 290 }, snacks: { baht: 70 + 40 + 112 } },
      ACCOMMODATION: {},
      LONG_DISTANCE_TRAVEL: { overnight_train: { baht: 2832 } },
      SHORT_TRAVEL: { train: { baht: 80 + 38 }, boat: { baht: 140 } },
      ACTIVITIES: { jim_thompsons_house: { baht: 300 } },
      OTHER: {}
    },
    stats: {
      walked: 8,
      temperature: 32,
      altitude: 1
    },
    food: [
      'hotel breakfast',
      'Paragon lunch (green curry, cashew chicken, chicken satay, mango smoothie, praline & chocolate cookie, almond & brown sugar pastry)',
      'snack dinner on train (crisps & dried mango)'
    ],
    entry: %(
Trying to keep the early mornings going, we woke up at 6.45am again. After
breakfast, we packed up & checked out of the hotel, leaving our bags there. We
spent the morning pootering up and down the river on the public boats - a cheap
and effective means of seeing the city from the water. The boats are long and
thin - significantly longer than the boarding piers. The entry and exit of the
boat is at the rear, so the driver cannot position it easily. To help, each of
the boats has a member of staff at the rear with a whistle to communicate with
the driver. They produced a whole raft of different noises for various different
situations, all of which easily cut through the low-pitched engine noises. (I'm
aware that "driver"and "rear" are unlikely to be the correct terms when on a
boat, but I find them clearer because they're more general). <R> I found the whistles
incredibly cool and not dissimilar to the way that a shepherd communicates with
a sheepdog... does that make us the sheep? </R>


We then briefly went to see a reasonably low-key buddhist shrine, at least, in
comparison to the temples the day before. We had lunch in an enormous food court
and tried to make our way to Jim Thompson's house. Jim Thompson was an American
architect turned soldier posted to Thailand at the end of WWII who became a silk
trader and possibly CIA agent. His house was an interesting mix of Thai and
european architecture and art.

We finished the day by picking up our bags and catching the sleeper train to
Chiang Mai. As I finish writing this, we've just had our curtained-off semi
compartment changed from two seats and a table into bunk beds and the air
conditioning is so strong I'm cold for the first time since I arrived.

![Bangkok Day 3](https://lh3.googleusercontent.com/MATo5E-vXbbBH2evGoCgKmL65DgdDMgjWyJXSaoLnEbdKSKq0xXnA0Jp0Y0wtYeEi-NPyt3jFrL6nqd_000W9ncekYZuCPXeifbeimIfbqNHzjcossPdNoJFE8TMMUx-IQ45ekxhcG8)
)
  },
  {
    date: '2018-01-09',
    number: 6,
    written: '2018-01-09 21:40',
    locations: [LOCATIONS[:ChiangMai]],
    expenses: {
      FOOD: { breakfast: { baht: 190 }, lunch: { baht: 190 }, street_food_dinner: { baht: 185 } },
      ACCOMMODATION: { baht: 700 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { taxi: { baht: 150 } },
      ACTIVITIES: {},
      OTHER: { hat: { baht: 180 } }
    },
    stats: {
      walked: 7.9,
      temperature: 33,
      altitude: 300
    },
    food: [
      'deep fried pumpkin, mango & sticky rice',
      'pineapple fried rice',
      'pork teriyaki skewers, banana roti with milo'
    ],
    entry: %(
We were woken up at about 6.30 am by the conductor announcing over the tannoy
that they needed to change our beds back into seats. We watched the sun rise as
the train pulled into Chiang Mai station, then packed up and left.

Chiang Mai is significantly smaller and noticeably cooler (at least in the
morning) than Bangkok. It still has the moat and some of the walls of the
original city, which we drove past to our hotel. We dropped off our bags, signed
up for a trip the next day and headed out to see some temples.

After Bangkok, we both knew we were pretty close to being templed out. However,
Chiang Mai has a lot of temples, they're mostly free and don't require booking.
We slowly wandered around as the day got hotter, admiring the architecture and
several groups of topiary animals.

Everything was cheaper in Chiang Mai, too - from the taxi to the food. The city
clearly depends on tourism and the museum explaining the history of the area was
very well done. A lot of it focused on the founding of the city, whereas the
annexation of the former kingdom of Lanna by Siam was stated briefly towards the
end.

We rounded off the day by spending quite a bit of time booking our next few
places to stay and transport between them - unfortunately necessary during a
long trip. We grabbed dinner at a near by night food market which had some
great-tasting food. I love banana pancakes, so had to try the "banana roti with
Milo" - an interpretation of the Indian flatbread roti filled with banana and
fried, then layered with condensed milk and Milo (a malted chocolate drink
powder). Definitely something I'll have a go at making!

![Day 1 Chiang Mai](https://lh3.googleusercontent.com/QxuT6USFHBaQXId0LIxGCr_0w-tRDidHh6otrBZ_tdawvjApakHraoBmtlhAGtacNPFXI8mNfedYPYTmZr0pG_Ag6z9Jd5viSYjOo0tOr6U7hsnvAYEeT3BPa_c0PNs7RX4HcDjzleU)
)
  },
  {
    date: '2018-01-10',
    number: 7,
    written: '2018-01-10 20:20',
    locations: [LOCATIONS[:ChiangMai]],
    expenses: {
      FOOD: { lunch: { baht: 100 }, street_food_dinner: { baht: 110 } },
      ACCOMMODATION: { baht: 700 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { tour: { baht: 2400 } },
      OTHER: {}
    },
    stats: {
      walked: 6.3,
      temperature: 33,
      altitude: 300
    },
    food: [
      'Pastry, pineapple, muesli, strawberry yoghurt, pineapple',
      'Sour chicken soup, chicken cashew curry, pineapple, watermelon',
      'Thai chicken curry noodles, pork leg with rice, sticky rice, coconut slice'
    ],
    entry: %(
Today we went on a tour organised through our hotel. It was an all-in-one kind
of deal - see a couple of waterfalls, the highest point in Thailand, a couple of
chedis, lunch, visit a couple of local tribes. Basically, we got on
a minibus, drove around quite a bit, got off for half an hour here and there to
take pictures, then back on the bus. Thrilling.

We both realised this sort of activity isn't really for us. We'd rather see only
the sites we find interesting (mainly the scenery) and be able to stop at things
we only glimpsed out the window, like the flower farms. The obligitory market
stops were no where near as informative a view on local life as the museum
yesterday was. The repeated grumblings from the three people in the back seat
who'd been told incorrectly that they could go swimming didn't really brighten
the bus journey back.

Some of the sights were impressive, though, particularly the view from the
chedis (or pagodas). It was interesting to learn that they had been constructed
by the Thai Air Force, but we were unable to learn why particularly they built
them, other than in honour of the king and queen's birthdays.

![Day 2 Chiang Mai](https://lh3.googleusercontent.com/L3phJsAEboP0jJE8sU1Tya3nmrERJH5ZYn8w7M63Xm5K0_v-LbkjcepuHYsULiiPQ-FKPofW0bO7Wa93pLh3A5XPNiM7eODRsF9CDVyrAD7VjT6mlLmgoPSHG-GntB-JZUZ6Z3UBvXI)
)
  },
  {
    date: '2018-01-11',
    number: 8,
    written: '2018-01-12 17:50',
    locations: [LOCATIONS[:ChiangMai]],
    expenses: {
      FOOD: {},
      ACCOMMODATION: { baht: 700 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { cooking_class: { baht: 2000 } },
      OTHER: { books: { baht: 590 }, thai_trousers: { baht: 190 }, pop_up_card: { baht: 100 } }
    },
    stats: {
      walked: 5.2,
      temperature: 28,
      altitude: 300
    },
    food: [
      'Pineapple, cornflakes',
      'Hot basil stir fry',
      'Papaya salad',
      'Spring roll',
      'Tom Sab',
      'Massaman curry',
      'Deep fried banana'
    ],
    entry: %(
This was probably the best day so far. Straight after breakfast we were picked
up and went to Asia Scenic cooking school. Maybe that breakfast was a bad idea.

We teamed up with a mixed group of ten other people and each chose seven
different recipes to make over the day. We donned strikingly pink aprons, toured
a local garden and market to learn more about specific Thai ingredients, then
headed back to the kitchen.

It was fun, informative and the food was informative. Rosie and I made
completely different recipes, so we got the opportunity to taste plenty of new
things. Rosie learnt how to make a delicious northern Thai curry she'd had the
day before, Khaw Soi, and I got quite a bit of two desserts, deep fried banana
and blue sticky rice with mango. I really enjoy making curry, so it was great to
get to make and try several curry pastes. Best of all, I'm pretty sure most of
the ingredients will be available in Edinburgh (somewhere) - I want to learn
things that I can make at home.

Funnily enough we didn't need dinner. We had a wander through the night market
so Rosie could buy some Thai thousers (Thaits?) and - shock horror - it actually
rained! At least, enough water fell from the sky for two minutes to prompt the
stall keepers to put out shelters, then the rain promptly stopped.
)
  },
  {
    date: '2018-01-12',
    number: 9,
    written: '2018-01-12 17:50',
    locations: [LOCATIONS[:ChiangMai]],
    expenses: {
      FOOD: { tea_and_fruit_shake: { baht: 155 } },
      ACCOMMODATION: { baht: 700 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { afternoon_tea: { baht: 1200 } },
      OTHER: { laundry: { baht: 300 } }
    },
    stats: {
      walked: 5.2,
      temperature: 28,
      altitude: 300,
      laundry: 5
    },
    food: [
      'hotel breakfast',
      'fruit shake',
      'afternoon tea (choco banana milkshake, quiche, cakes, tarts, sandwiches, scones, jam)'
    ],
    entry: %(
Today was a bit more chilled out it more ways than one. Primarily we didn't have
anything booked, but in addition the temperature had dropped to about 18°C.

We spent the morning wandering through Chiang Mai with the aim of booking
tomorrow's activities, our onwards transport, and most importantly, scoping out
afternoon tea. Several of the more expensive hotels ($300 a night rather than
our $20 a night place) offer afternoon tea, complete with an "artistic tower of
sweet and savoury temptations". We ended up at 2pm on the riverside balcony of
the Anantara hotel with tea, scones, about fifteen different snacks and a
milkshake each. Admittedly, the milkshake probably works a lot better at the
more normal temperatures of 25-35 degrees. <R> Afternoon tea was amazing and
is something I've always wanted to do! </R>
)
  },
  {
    date: '2018-01-13',
    number: 10,
    written: '2018-01-14 21:00',
    locations: [LOCATIONS[:ChiangMai]],
    expenses: {
      FOOD: { pastry: { baht: 35 + 18 }, tea: { baht: 40 }, beer: { baht: 70 }, shake: { baht: 75 }, pizza: { baht: 720 }, ice_cream: { baht: 30 } },
      ACCOMMODATION: { baht: 700 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { elephants: { baht: 3400 } },
      OTHER: {}
    },
    stats: {
      walked: 5.6 + 1.5,
      temperature: 21,
      altitude: 300
    },
    food: [
      'ham & cheese croissant, danish pastry',
      'rice, potato curry, pineapple, veg, fried chicken',
      'banana milkshake',
      'pesto bacon pizza, three cheese pizza, honey & lime water'
    ],
    entry: %(
The main activity today was going to meet some elephants. It's a popular thing to do in Chiang Mai
and was really interesting. There are loads of places that do it with very similar descriptions so
we'd spent some time having a look for one with good reviews that didn't include anything else
(unlike our first tour).

We were picked up by a songthaew at 7am and driven, along with six other tourists, two hours out of
the city. A songthaew is one of the many adaptations of the Thai pickup truck - in this case, it's a
standard pickup with a roof over the back and a bench along each wall. I'm sure the breeze in the
open back is normally both refreshing and exhilirating, but unfortunately the weather wasn't any
better than yesterday so we were all soon pretty cold.

Once we got to the elephants, the day got better. There were two of them, both very calm but also
impressive. We fed them sugar cane which allowed them to show their ingeniuity - the male, Jimmy,
stuffed a bit of sugar cane behind his tusk to maximise the amount he could get while storing some
for later. We then walked for about ten to twenty minutes to a river where we (mainly Rosie) gave
the elephants a mud bath, covering them in mud, then throwing water at them when they went into the
river. <R> They were just such massive animals that it was hilarious to see Jimmy wander into the river
and roll around like a dog </R>

We were pretty tired once we got back to Chiang Mai. We had thought about going to a temple out of
town that supposedly was a great viewpoint, but it was still very cloudy so we opted for a walk
around the city walls. We ended up chilling beside a pond in a park with a couple of ice creams,
followed up an hour later by a surprisingly large banana milkshake (served in a jug, not a glass).

By chance, one of Rosie's friends from our halls in St Andrews, Tara, happened to have arrived in
Chiang Mai within the last day or two. We met up for dinner today with her and her boyfriend to
catch up. They'd been travelling for the past two or three months in many of the countries we are
about to go to, so gave us plenty of tips. We had a great meal swapping stories, then headed back to
pack up, ready for our bus in the morning.
)
  },
  {
    date: '2018-01-14',
    number: 11,
    written: '2018-01-14 21:00',
    locations: [LOCATIONS[:ChiangMai], LOCATIONS[:HuayXay]],
    expenses: {
      FOOD: { tea: { baht: 35 }, dinner: { kip: 100_000 } },
      ACCOMMODATION: { kip: 110_000 },
      LONG_DISTANCE_TRAVEL: { bus: { baht: 830 }, tuk_tuk: { baht: 830 }, songthaew: { kip: 41_000 } },
      SHORT_TRAVEL: {},
      ACTIVITIES: {},
      OTHER: { visa: { dollars: 36 }, toilet: { baht: 6 } }
    },
    stats: {
      walked: 3.0,
      temperature: 26,
      altitude: 400
    },
    food: [
      'crisps, cake, pain au raisins',
      'spring rolls, pork & pineapple fried rice, watermelon juice'
    ],
    entry: %(
I wasn't particularly looking forward to this morning. There's something about a six-hour bus
journey in the immediate future that just hints that it's not going to be a great day. However, the
bus was actually pretty decent - a reclining seat (including leg rest), free snack & water, and an
on-board toilet. We also spent the journey listening to a fairly intense part of the Wheel of Time
series, which made the time fly. <R> Note: You can convince Daniel to do just about anything if
you allow him to listen to the Wheel of Time at the same time. </R>

Up next was the Laos border crossing, 4km from the bus stop. That required a tuk tuk ride, a $35
dollar fee & passport photo for a visa, an extra $1 because it's the weekend and a songthaew 10km
to the town we're staying in (Huay Xai).

Negotiating the songthaew took quite a long time because we had to do it with the four other
tourists who had just crossed the border. We all had different anounts of different currencies and
different ideas of what was a good deal. The driver spoke very little English and kept changing
between giving prices in Thai baht and Lao kip. After everyone was somewhat happy, we were on our
way - on the *right* side of the road. In Thailand, they drive on the left.

We found our hotel, dumped our stuff, got money, booked our bus away in three days and checked in
with our reason for being here - the Gibbon Experience, which we start tomorrow. Finished
organising, we found a riverside restaurant to eat, read, and enjoy the sunset over the Mekong
river, <R> which was gorgeous </R>.
)
  },
  {
    date: '2018-01-15',
    number: 12,
    written: '2018-01-18 16:40',
    locations: [LOCATIONS[:HuayXay], LOCATIONS[:Gibbons]],
    expenses: {
      FOOD: { tea: { kip: 5_000 }, cheese_sandwich: { kip: 10_000 }, banana_pancake_and_honey: { kip: 25_000 } },
      ACCOMMODATION: {},
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { gibbon_experience: { dollars: 773 / 3 } },
      OTHER: {}
    },
    stats: {
      walked: 4,
      temperature: 25,
      altitude: 630,
      height_above_ground_while_sleeping: 25.0
    },
    food: [
      'banana pancake & honey',
      'rice, chicken, papaya salad',
      'rice, water spinach, mushrooms, fried chicken, minced pork, tiny oranges'
    ],
    entry: %(
This was the day I was looking forward to most, at least within the first few weeks of our trip. We
had booked the Gibbon Experience - three days spent in the jungle trying to spot wild gibbons,
sleeping in treehouses and ziplining between them. For quite a long time I've had a semi-serious
running joke that ziplines should be used in more places as a form of transport - I think they lend
themselves equally well to areas with tall buildings or large hills, plus they are far more
enjoyable than other means of transport.

Anyway, I'm getting a bit distracted. We dropped off our stuff at the main office, had a rushed
breakfast, watched a safety video, then crammed into a tiny songthaew with four other people. It
turned out being packed together so tight probably made it easier to stay in the back without
getting bounced out. After an hour and a half on tarmac, we stopped, picked up a few dozen eggs and
a can of beer for those that wanted it, then drove through a river onto an incredibly bumpy dirt
track for 40 minutes. The beers were gone fast - every bump of the road caused them to froth more
and more out of the can.

After having lunch in the village we stopped at, we trekked up through the jungle to a couple of
huts and some locals playing a game somewhere between volleyball and football. We collected our
harnesses and the group of 20 was divided into treehouse groups. Rosie and I ended up with four
others heading for treehouse seven.

In our smaller group, we made our way to our treehouse both by walking and by zipline. The wires
were rigged in such a way that they eliminated some parts of the path, with one zipline out and
another nearby for the journey back.

The flights themselves were fantastic. Spectacular views of the jungle both near and far, hundreds
of metres long and many over a hundred metres high. Each was slightly different in terms of speed
towards the end, so we had to hold our feet up to try and go faster or squeeze a bit of old tire
around the wire above us to act as a brake. Sometimes I wouldn't quite make it to the end, so would
have to grab the wire and haul myself hand-over-hand to the end. After getting off, we had to hit
the wire three times in a row to send a signal to the other side, letting them know it was safe to
go.

The final zipline was to our treehouse. It was 25 metres from the ground, or at least, to the bottom
storey (landing platform, toliet and shower). The middle storey was the largest, with space for four
double mattresses & mosquito nets, a large, low table, ten stools and a sink with running drinking
water. The top storey was about five metres up, a little crow's nest with a single mattress to sit
on.

We revelled in the view. We had a spectacular view down the valley, surrounded completely by jungle.
The sun was setting just out of sight behind the trees as we took it in turns to have a shower -
surprisingly, the shower was the place with the best view in the treehouse. It was amazing, at least
until plunging into the freezing shower water.

Our dinner arrived by zipline - there was a small collection of huts nearby that served as our
kitchen, with five or six people living there, including our two guides (at least for these two
nights). It was delicious and plentiful, with four different dishes along with sticky rice and tiny
oranges to follow.

We ended the night swapping magic tricks and card games with our guides, primarily "magic" Mike (or
"monkey" Mike as he also told us to call him). We played spoons, which was great fun, but probably
scared away any interesting animals. I learnt a new game, called "game".

## Rules to "Game"

*Decks*: 1 or 2
*Players*: 4+, in pairs

* Each pair decides on a secret signal to give when one of them has 4 of a kind
* Pairs sit opposite each other in the circle
* Each player is dealt 4 cards by the dealer
* One player in each pair looks at their hand, then gives it to their partner
* The partner chooses any 4 out of the 8 cards they hold to keep, then returns the remaining 4
* The dealer deals 4 cards face up in the centre of the table, then counts to hree out loud
* All players grab up to two cards that they need to form 4 of a kind, then discard into the middle
* Once no one wants to swap cards with the middle, the dealer replaces the middle cards & counts
* Once a player has 4 of a kind, they make the signal to their partner
* The _partner_ then can say "game", ending the round, scoring 1 point for that pair
* Alternatively, the partner can try and also get 4 of a kind, then say "double game", scoring 2
* However, if another player sees the secret signal and says "stop the game", the pair scores -1
* The first pair to 5 wins
)
  },
  {
    date: '2018-01-16',
    number: 13,
    written: '2018-01-19 21:20',
    locations: [LOCATIONS[:Gibbons]],
    expenses: {
      FOOD: {},
      ACCOMMODATION: {},
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { gibbon_experience: { dollars: 773 / 3 } },
      OTHER: {}
    },
    stats: {
      walked: 6,
      temperature: 26,
      altitude: 630,
      height_above_ground_while_sleeping: 25.0
    },
    food: [
      'tiny oranges, tomato-based sauce, deep fried spring rolls, omlette, rice, mushrooms, vegetables',
      'rice, chicken, vegetables',
      'pasta, chips, vegetables, aubergine sauce'
    ],
    entry: %(
Sleeping in a treehouse has its ups and downs. Sunset - definite up. Rats and squirrels in the
night, however, don't improve my sleep. We'd stored all our food in a box, but the giant black
squirrels were happy enough to scurry over our treehouse, pick off bark from the tree, squeaking all
the while. Coupled with the snoring of one of our treehouse-mates, Rosie and I didn't sleep
particularly well either night in treehouse seven.

After a delicious breakfast, we zipped and walked to treehouse one to try and spot gibbons. It was
the biggest treehouse, sprawling across two trees and at least four levels. Unfortunately we didn't
see any gibbons (apart from in a video on one of the guides' phones), so we zipped home for lunch.

The afternoon was more focused on ziplining than wildlife. We visited three other treehouses,
including treehouse five, almost 50 metres from the ground (apparently the world's highest). At
another, we saw a bright green snake very slowly moving along a branch of an adjacent tree. We spent
quite a bit of time at a tree which was the centre of a figure of 8 made up from four ziplines,
flying from the tree to the ground, walking a bit up hill, then zipping back to the tree. The height
that we had to walk up to be able to zip hundreds of metres was surprisingly little. I definitely
think they should be used in more places ...
)
  },
  {
    date: '2018-01-17',
    number: 14,
    written: '2018-01-19 21:40',
    locations: [LOCATIONS[:Gibbons], LOCATIONS[:HuayXay]],
    expenses: {
      FOOD: { pringles: { kip: 20_000 }, drinks: { kip: 28_000 } },
      ACCOMMODATION: {},
      LONG_DISTANCE_TRAVEL: { kip: 350_000 },
      SHORT_TRAVEL: {},
      ACTIVITIES: { gibbon_experience: { dollars: 773 / 3 } },
      OTHER: {}
    },
    stats: {
      walked: 4.6,
      temperature: 26,
      altitude: 630
    },
    books: {
      reading: {
        finished: {
          title: 'Down and out in South East Asia',
          author: 'Alex Watts'
        }
      },
      listening: {
        finished: 'The Gathering Storm',
        author: 'Robert Jordan and Brandon Sanderson'
      }
    },
    food: [
      'eggs, bread, tamarind & coconut jam, peanuts with garlic & kaffir lime leaves, apple, pear',
      'noodles',
      'iced coconut juice',
      'pringles'
    ],
    entry: %(
We woke up to another cloudy morning, leaving an atmospheric (pardon the pun) fog in the valley
below the treehouse as it burnt off. We packed up, had another great breakfast (bread and tamarind &
coconut jam), took a final photo of our treehouse, then headed back down to the village we had
started at.

It was another bumpy drive back to the main road, where we stopped for lunch. We found out that a
couple of other people from our treehouse were also headed to Luang Prabang by overnight bus.
They'd already taken the bus once and were full of stories about how awful it was. Windy roads,
a cramped bed shared with another passenger, frequent stops, jammed full with people sleeping in the
aisle ... but if they were getting it again, it can't have been _that_ bad, can it?

Back in Huay Xai at the main office, we killed a couple of hours showering, repacking and reading by
the side of the Mekong river. At 5pm, slightly apprehensive about the night ahead, we got in a
songthaew to the bus station. The bus was there and apparently different from the sleeping bus we'd
been told about, possibly better.

Unfortunately, it wasn't. We both had something between a seat and a bed with seatbelts that didn't
work and after a huge number of locals piled into the bus we had someone practically sleeping on our
feet. The driver took off, turning off the lights, but making liberal use of his horn. The road
wasn't massively windy, but the stops did seem to be located about two minutes before I would
otherwise have been able to get to sleep. We did, however, manage to finish listening the the third
last Wheel of Time book. Only about 80 hours to go!
)
  },
  {
    date: '2018-01-18',
    number: 15,
    written: '2018-01-19 22:00',
    locations: [LOCATIONS[:LuangPrabang]],
    expenses: {
      FOOD: { street_food_dinner: { kip: 20_000 + 20_000 + 10_000 + 5_000 }, breakfast: { kip: 40_000 }, lunch: { kip: 120_000 } },
      ACCOMMODATION: { dollars: 18 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { songthaew: { kip: 160_000 + 40_000 }, boat: { kip: 20_000 } },
      ACTIVITIES: { waterfall_park_entrance: { kip: 30_000 } },
      OTHER: { placemats: { kip: 50_000 } }
    },
    stats: {
      walked: 9.5,
      temperature: 29,
      altitude: 300,
      laundry_weight: 4
    },
    food: [
      'banana and coconut sticky rice',
      'mango spring rolls, baked potato with Lao sausage and blue cheese sauce, choco-banana milkshake',
      'pork & vegetable dumplings, sticky jerky covered in sesame seeds, chocolate cinnamon bread, coconut dumplings'
    ],
    entry: %(
We woke up (if you can call the brief spells of unconsciousness the night before "sleep") at 5.30am
as the bus arrived. We shared a songthaew into town, dropped off our bags at our guest house, then
walked into the centre. <R> My bad night was made even worse by the fact that I had picked up a cold
the day before which had steadily developed over the course of the night to be a full blown case of
the sniffles. </R>

One of the main things to do in Luang Prabang, apparently, is to watch the alms giving at dawn. As I
was told by culturally insensitive American who wishes to remain nameless, alms giving is distinct
from thanksgiving by the lack of turkey. It also involves considerably more Buddhist monks. It was
as described - lines of monks walking the main street, being given food by others and photographed
by tourists. <R> It was **very** early in the morning. </R>

We managed to find somewhere opening for breakfast, then went to the UXO information centre. "UXO"
is short for UneXploded Ordinance - a problem that Laos, the most heavily bombed country per capita
in the world, suffers from daily. It was a fascinating, if harrowing, exhibition.

We were then able to check in to our guest house and use the wifi to decide on what to do for the
rest of the day. We found somewhere with a great sounding lunch that didn't disappoint, then caught
another songthaew, then boat, to a nearby waterfall. Because it's the dry season, the waterfall
wasn't particularly impressive, but we were able to have a bit of a (chilly) swim.

Back in Luang Prabang, we waited for the sunset beside the Mekong, then wandered through the night
market. We weren't massively hungry, but coudn't say no to some street food. By far the best were
some small coconut pancakes / dumplings made in large dishes with ladle-sized indents, similar to
Dutch pancakes but far more moist.

Returning early to our room, we caught up with home, work and sleep, despite thin walls and the
dulcet tones of a guitar-playing fellow guest. <R> Literally every other note was wrong. </R>
)
  },
  {
    date: '2018-01-19',
    number: 16,
    written: '2018-01-19 22:20',
    locations: [LOCATIONS[:LuangPrabang]],
    expenses: {
      FOOD: { drinks: { kip: 66_000 }, coconut_pancake: { kip: 10_000 } },
      ACCOMMODATION: { dollars: 18 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { cooking_class: { kip: 500_000 }, hill_stupa: { kip: 40_000 } },
      OTHER: {}
    },
    stats: {
      walked: 5.4,
      temperature: 29,
      altitude: 300
    },
    food: [
      'banana pancake & honey, fruit',
      'rice cake with spicy tomato sauce',
      'fresh spring rolls',
      'papaya salad',
      'chicken in coconut milk soup',
      'steamed fish in banana leaves',
      'lemongrass chicken',
      'pumpkin in coconut cream',
      'Laow lao ("whiskey" made from sticky rice)',
      'banana and avocado smoothie',
      'black rice wine, black rice wine with lime',
      'coconut pancake (more like a waffle)',
      'coconut pancake (more like a dumpling)'
    ],
    entry: %(
Sleeping in a bit meant that we had a rushed morning to make our 9am cooking class on time.
Unfortunately, this one didn't quite live up to our previous experience. The market visit was
interesting, both to see what's available and the condition it's sold in (plenty of flies around the
meat ...). At the restaurant, we had to decide, in our group of nine, which six dishes to make out
of 27. We shared the prep of all the ingredients, then one person was assigned a recipe to a person
to cook. We then ate all of the food together.

Together, this meant we made very little ourselves and weren't really able to experiment with
flavours as we had been before. However, I did learn quite a bit more about how rice, particularly
sticky rice, is used in Laos, and got to try, if not make, rice cakes and rice "whiskey".

Fairly full, we made our way back to the guest house and, because it had come up in conversation,
took some Myers-Briggs personality tests. These weren't very revealing - they all agreed I'm
introverted (shock!), but over three tests I was assigned different results for the other three
categories.

After that short interval, we tried to catch the sunset from the stupa on the hill in the centre of
Luang Prabang. The hill is about around 300 steps to the top and has various Buddhist temple
buildings on it. As we discovered, at sunset it also has  hundreds of people crammed onto the peak.
We decided to skip the crowds, so wentlower and still got a decent view.

We returned to the night market and sat in a restaurant near the food part which had its own bakery
stall outside. We tried black rice wine with and without lime juice - a surprisingly good addition.
I also discovered their banana and avocado smoothie, almost chocolaty in its creaminess. I
definitely need to replicate that if possible.
)
  },
  {
    date: '2018-01-20',
    number: 17,
    written: '2018-01-20 20:20',
    locations: [LOCATIONS[:LuangPrabang]],
    expenses: {
      FOOD: { dinner: { kip: 165_000 }, coconut_pancake: { kip: 5_000 }, lunch: { kip: 35_000 } },
      ACCOMMODATION: { dollars: 18 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { minibus: { kip: 100_000 } },
      ACTIVITIES: { waterfall_entrance_fee: { kip: 40_000 } },
      OTHER: { laundry: { kip: 40_000 } }
    },
    stats: {
      walked: 6,
      temperature: 29,
      altitude: 300
    },
    books: {
      reading: {
        started: {
          title: 'Royal Flash',
          author: 'George MacDonald Fraser'
        }
      }
    },
    food: [
      'banana pancake & honey, fruit, banana milkshake',
      'dried friut, apricot pastry, cornetto',
      'laap (herby chicken salad), slow cooked pork with banana leaves, carrot, lemongrass and rice',
      'coconut pancake (more like a dumpling)'
    ],
    entry: %(
After a proper lie in (to 9.15), we got up in time to make proper use of the guesthouse breakfast,
not just rush through it. Our plan for the rest of the day was to visit Kuang Si waterfall, which
seemed to be _the_ main attraction in Luang Prabang. At least, every time we walked past a tuk tuk
or songthaew driver their standard question was simply "Waterfall?".

We wandered up to one of the main places to find tuk tuks, haggling with a few. We knew it was
cheaper to share the 27km journey with others, so wanted to find drivers with other people heading
that way. After a few minutes, one guy said that he could find us one to share and brought us to his
friend's almost full Toyota Commuter (not as common as in Thailand, but still _everywhere_). This
seems to be a common way of doing things in Laos - lots of drivers and stall owners seem to work
together, sharing business so that the person who can most easily provide the goods or service does
and presumably the group benefits.

The waterfall was fun and quite impressive, particularly given that we've now seen quite a few in
quick succession. We walked up to the top, had a go on a swing only just above a pool at the top
(and ended up with wet feet). After an ice cream lunch we had  a bit of a swim in one of the
"refreshing" pools below the main falls.

Also contained within the waterfall park area was a "Free the Bears" moon bear rescue centre. Fairly
large black bears, their bile is apparently highly prized for its restorative powers. There were
about a dozen bears and cubs in enclosures, rescued from bile farms or from being kept as pets. It
was hard to tell exactly what the intent of the sanctuary was - there didn't seem to be much said
about releasing the bears, but neither were they really being used as a tourist attraction, given
that entrance was free after paying to get in to the waterfall park.

Back in Luang Prabang, we had the best meal of our trip so far. It was in a small restaurant on the
main street, specialising in a fusion of French and Lao cuisine. I had laap - a traditional local
salad made from minced chicken, plenty of herbs, spring onions and fried garlic - followed by slow
cooked pork belly, rice, banana flower, carrots and lemongrass. Rosie had a trio of dips followed
by a Thai shrimp bisque. I normally don't like bisque, but the creaminess combined with a lot of the
flavours we've been having in local food and cooking with was amazing.
)
  },
  {
    date: '2018-01-21',
    number: 18,
    written: '2018-01-21 20:40',
    locations: [LOCATIONS[:LuangPrabang], LOCATIONS[:Trat]],
    expenses: {
      FOOD: { breakfast: { kip: 24_000 }, nuts: { baht: 150 }, street_food_dinner: { baht: 150 } },
      ACCOMMODATION: { baht: 300 },
      LONG_DISTANCE_TRAVEL: { bus: { baht: 476 } },
      SHORT_TRAVEL: { airport_shuttle: { kip: 50_000 } },
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 3.1,
      temperature: 30,
      altitude: 100
    },
    books: {
      reading: {
        finished: {
          title: 'Royal Flash',
          author: 'George MacDonald Fraser'
        }
      }
    },
    food: [
      'mango cake, ginger & lemon cake, nutella and peanut pastry',
      'salted pistachios, fermented milk drink',
      'spring roll, moneybag, deep fried noodles & tofu, sweet chilli & peanut butter sauce, pork skewers, savoury coconut pancake, chicken satay & pickles, ovaltine milkshake'
    ],
    entry: %(
Today was a travelling day, so not much to report. We were up early (5.30am) to get to the airport
for about 6.15 for our 7.40 flight. The airport was tiny - there were _maybe_ three other people
going through security. The only (minor) excitement was that I found the key to our hotel room in my
pocket. Damn.

We flew back into Bangkok and caught a six hour bus to Trat. We're just spending a night in Trat on
our way to Koh Mak, an island nearby. We managed to avoid a brief deluge, getting into our guest
house minutes before it started. Afterwards we sampled many different small dishes at the local
night market, including (of course) another load of delicious deep fried foods - spring rolls, tofu,
and noodles. In some ways it's not healthy, but food that we see being deep fried is probably less
likely to give us food poisoning. That, and it's incredibly good with the variety of sweet chilli
sauces here.
)
  },
  {
    date: '2018-01-22',
    number: 19,
    written: '2018-01-24 16:00',
    locations: [LOCATIONS[:Trat], LOCATIONS[:KohMak]],
    expenses: {
      FOOD: { breakfast: { baht: 140 }, lunch: { baht: 180 }, dinner: { baht: 1000 } },
      ACCOMMODATION: { baht: 800 },
      LONG_DISTANCE_TRAVEL: { boat: { baht: 900 } },
      SHORT_TRAVEL: { tuk_tuk: { baht: 200 } },
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 5,
      temperature: 30,
      altitude: 1
    },
    books: {
      reading: {
        started: {
          title: 'The Goal',
          author: 'Eliyahu M. Goldratt'
        }
      }
    },
    food: [
      'banana crepe with honey',
      'pork fried rice',
      'chicken satay, chicken massaman curry, banana milkshake'
    ],
    entry: %(
(Today's post has a guest author: Rosie. Daniel cannot be held responsible for the accuracy of the
information provided, and would actively question some of the opinions presented)

<R>

Today was to be an exciting day, we were heading off to the thai island Koh Mak but first we needed
to rectify a small issue of the day before, the fact that we still had the key to our hotel room in
Luang Prabang, and for that we needed a post office. So we sent off into the town of Trat; before
tea, before breakfast and accompanied by my ever present sniffles. I was what you might call grumpy,
if you were brave enough. After finding the post office I left Daniel in search of the supermarket
that maps.me (great app)  informed me was right around the corner in an attempt to buy some tissues
that didn't feel like sand paper. After wandering aimlessly through aisle filled with 97 different
brands and varieties of washing powder (who needs that much choice) I found the single package of
tissues and had to rush to pay for them before I sneezed again. I found Daniel back at the post
office and wandered back to the hotel where I had breakfast and a cup of tea and thus
felt like a new woman.

The songathew picked us up at the hotel and took us to the port where we learned that among other
fellow riders we would be sharing the boat with a live chicken. Which was fortunately confined to a
box but occasionally left out a squawk of disapproval of such confinement. The first 50 minutes of
the boat trip was relatively uneventful however the last 5 were wet, very wet. As we pulled into the
harbour the heavens opened and as we got out, we and our stuff got very wet indeed. However by the
time the songathew had dropped us off at our hotel it has stopped raining all together. I believe
these downpours are reasonably common here but my goodness was it a lot of water!

After a brief lunch where Dan ordered much better than me (annoying) we decided to go for a swim in
the sea. We donned swim suits and Daniel then announced as much to his own surprise as mine that he
didn't think he needed any sunscreen. This was in contrast to every day of the trip thus far where
sunscreen has been liberally applied with a paint roller that he brought expressly for the purpose
and which I am forbidden to touch (This is potentially a very slight exaggeration).

The sea was lovely and warm and surprisingly salty (I know, I know, but you forget these things)
however the shower afterward was fresh and surprisingly cold so maybe things are different here.
After showers we sat on the beach for an hour or two reading (and programming) and trying to
convince the puppies that live at this hotel to play with me, there are four and they are adorable!!
After a time it became happy hour however upon approaching the bar we were informed that the man who
made the cocktails was out fishing so we would have to wait. He came in later with one very small
fish but he looked very proud of himself and thus my mojito was not missed in vain.  By the time he
got back however it was time to search for dinner and so we headed off towards the major town to a
restaurant called Table Tales.

The food was great, and I got a mojito 😊. We started with chicken satay and then I had scallops
which were perfectly done and covered in garlic butter and Dan had a masaman curry which
unfortunately was a little bit sweet, even for Dan (I know) but the roti that came with it was
great. We headed back to the hotel, opting for roads this time rather than the jungle trails were
had used to get to dinner. After admiring the moon over the water (and reading/programming) for an
hour or so we headed to bed.

</R>
)
  },
  {
    date: '2018-01-23',
    number: 20,
    written: '2018-01-24 16:10',
    locations: [LOCATIONS[:KohMak]],
    expenses: {
      FOOD: { breakfast: { baht: 340 }, lunch: { baht: 525 }, dinner: { baht: 690 }, cocktails: { baht: 220 }, water: { baht: 20 } },
      ACCOMMODATION: { baht: 800 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 8.1,
      temperature: 30,
      altitude: 1
    },
    food: [
      'banana milkshake, blueberry cake',
      'panang curry, banana milkshake',
      'pina colada',
      'pineapple and bacon pizza'
    ],
    entry: %(
This was a pretty chilled, lazy day for a number of reasons. Primarily, most weather forecasts said
it was going to rain (it didn't). Secondly, we spent a bit of time working out how much we'd been
spending, which has a tendency to make both of want to spend less. Thirdly, Rosie's cold isn't
completely gone, so snorkelling isn't really that appealing. Finally, I wanted to get a bit of
programming done - writing these posts is a bit more useful if I've got a site to put them on.

We spent the day by the beach, reading, programming, swimming and going for a bit of a walk to find
lunch. There are quite a few swings hung from the palm trees, so we had a bit of a play on them,
too. We spent quite a while looking for a good place for dinner, then headed back to our beach for
a game of cards (beanie) which Rosie won (in suspicious circumstances - she dealt half of the hands,
after all).

PS. Shock of the day: Rosie got sunburnt and I didn't!
)
  },
  {
    date: '2018-01-24',
    number: 21,
    written: '2018-01-28 16:30',
    locations: [LOCATIONS[:KohMak]],
    expenses: {
      FOOD: { drinks: { baht: 160 }, lunch: { baht: 410 }, water: { baht: 30 }, cocktails: { baht: 220 }, dinner: { baht: 610 } },
      ACCOMMODATION: { baht: 800 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { stand_up_paddle_board: { baht: 100 } },
      OTHER: {}
    },
    stats: {
      walked: 8.4,
      temperature: 27,
      altitude: 1
    },
    food: [
      'pineapple and bacon pizza, banana and chocolate shake',
      'pork red curry, rice, banana shake',
      'Laap-style dish with strips of grilled pork'
    ],
    entry: %(
Somewhat like the day before, according to most weather forecasts it was supposed to rain quite a
bit, but didn't. We took advantage of this in the morning by renting a stand up paddle board and
paddling out to (& around) a small island nearby. It wasn't exactly an island - the water between
the shore and the island wasn't deep enough to paddle through, so we had to get off for a while. At
low tide it may be dry land, not that there's much tidal variation.

On the way back we were able to see plenty of leathal-looking, spiky sea urchins and fish, including
little shoals that would repeatedly jump out of the water. We then went for a swim in the still,
clear water. The threatened rain never materialised - much to Rosie's disappointment. She was
looking forward to being in the water while it poured down on us.

We spent the afternoon reading & programming again - I managed to get the site to the point that it
could display basic posts and load in all of the ones I had written so far. We then walked back to
close to where we'd been for dinner the previous day to a Swiss restaurant we'd booked for dinner.
)
  },
  {
    date: '2018-01-25',
    number: 22,
    written: '2018-01-28 16:50',
    locations: [LOCATIONS[:KohMak]],
    expenses: {
      FOOD: { breakfast_snacks: { baht: 55 }, breakfast_drinks: { baht: 120 }, lunch: { baht: 500 }, dinner: { baht: 550 } },
      ACCOMMODATION: { baht: 800 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { kayak: { baht: 300 }, snorkels: { baht: 200 } },
      OTHER: {}
    },
    stats: {
      walked: 4.5,
      temperature: 27,
      altitude: 1
    },
    food: [
      'biscuits, peanut brittle, banana shake',
      'cashews, ham and pineapple fried rice, banana shake',
      'shrimp spring rolls, sweet chilli sauce, dry red curry, rice, avocado & banana smoothie'
    ],
    entry: %(
This was supposed to be the day with the best weather, but was much the same as the previous few
days - some cloud, some sun. We walked south to the beach we'd arrived at and rented a sit on top
kayak and snorkel gear. There were a pair of small islands a couple of kilometres from the hotel we
rented the kayak from which were supposed to be good for snorkelling.

We headed out towards the islands with small waves slightly against us and to the side - just enough
to cause us to have to fight a bit to maintain our course, but not too strong. The water remained
pretty clear and shallow enough to see the bottom for quite a long way, but the waves meant the
surface wasn't still enough to see much.

We knew that one of the islands was privately owned and had a fee of 100 baht ($3/£2.50) for landing
on it, but we didn't know which one. We landed briefly on the first island, on a tiny beach with
forest right up against it. The broken bits of coral there were incredibly intricate, but it didn't
look like the best place to snorkel. We kayaked out around the second island, avoiding a beach with
a crane and people building something, landing on a beach at the back. At no point on either island
did anyone appear to demand 100 baht - I'm not sure if there even were people on the first island.

The beach on the second island was stunning - a small band of white sand squeezed between the forest
to one side and cliffs on the other, with forest covering the steep hill behind the beach. Not far
from the beach was a tiny cove cut into the cliff with just enough of a sand bar for a single tree.

We went snorkelling between the beach and the cove and saw loads of life. In addition to the spiky
black sea urchins, there were plenty of small fish of a variety of colours and some larger, more
impressive ones - a delicate golden fish that we both initially mistook for a big leaf and a
leopard-spotted fish (which I think was the same type as was caught by our host a few days before,
robbing Rosie of the chance for a mojito). The most impressive sights, though were the openings into
the giant clams. These were bright blues or deep reds, often sunken into the sand or something that
looked like a rock so that all I could see was a wavy coloured line, opening and closing.

After snorkelling for a while, we got back on the kayak and headed back to shore. We were able to
use the hotel's outdoor shower and were sorely tempted by it's pool, which we probably weren't
allowed. We finished off the day at a bakery and art hut, which had some pretty decent food and
several cats. After we ordered, someone was immediately dispatched to buy the ingredients (bananas)
that they'd run out of. I tried another avocado & banana shake, unfortunately not as smooth as in
Luang Prabang.
)
  },
  {
    date: '2018-01-26',
    number: 23,
    written: '2018-01-28 20:40',
    locations: [LOCATIONS[:KohMak], LOCATIONS[:BangkokSecond]],
    expenses: {
      FOOD: { snacks: { baht: 125 }, lunch: { baht: 50 }, dinner: { baht: 585 } },
      ACCOMMODATION: { dollars: 21 },
      LONG_DISTANCE_TRAVEL: { boat: { baht: 900 }, bus: { baht: 460 } },
      SHORT_TRAVEL: { songthaew: { baht: 300 } },
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 1.9,
      temperature: 29,
      altitude: 1
    },
    food: [
      'biscuits, peanut brittle',
      'peanut m&ms, crisps, rice cakes, banana shake',
      'chocolate-filled wafer sticks',
      'duck red curry, thai dessert balls, strawberry shake'
    ],
    entry: %(
We left Koh Mak at 9am from the pier just outside our resort. It was a loud, if uneventful journey.
The speedboads they use have three pretty huge outboard motors, so it's not that easy to listen to
anything else. I got a decent way through my book, though.

Once we got back to the mainland we got a songthaew (with a very low roof - ouch) to the bus station
and caught the 11am bus to Bangkok. Six hours of the Wheel of Time later, we arrived at a large bus
station, refusing offers of tuk tuk rides because we knew that the trains in Bangkok were great.

We were wrong. Travelling on Bangkok's public transport at rush hour is nothing like during the day.
We needed travel two or three miles as the crow flies, which without rucksacks we would have walked.
There wasn't a direct link, so we needed to go three sides of a square to get there - a skytrain, a
subway and another skytrain, only a stop or two on each. Each train and station was increasingly
packed full of people. In the second train, there was no room to move. We had to wait in line for
about half an hour before enough people got off the skytrain for us to (just) fit on.

After close to an hour and a half, we got to our hotel, which was surprisingly nice. Unlike our
previous hotel in Bangkok, the windows actually opened to the _outside_, not just a fake hedge. We
found an islamic Thai restaurant & bakery and had some decent food, interesting (really sweet) Thai
sweets and a fantastic strawberry shake - probably just ice blended with loads of fresh strawberries
and a bit of sugar syrup. After the frustrating journey through Bangkok, the meal was just what we
needed.
)
  },
  {
    date: '2018-01-27',
    number: 24,
    written: '2018-01-28 21:30',
    locations: [LOCATIONS[:BangkokSecond], LOCATIONS[:Kampot]],
    expenses: {
      FOOD: { snacks: { dollars: 2 }, lunch: { dollars: 7 }, dinner: { dollars: 12 } },
      ACCOMMODATION: { dollars: 6 },
      LONG_DISTANCE_TRAVEL: { flight: { pounds: 161 }, bus: { dollars: 20 } },
      SHORT_TRAVEL: { tuk_tuk: { dollars: 3 }, skytrain: { baht: 60 } },
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 3.2,
      temperature: 28,
      altitude: 1
    },
    food: [
      'rice crackers, popcorn, almond buns, curry ham sandwiches',
      'fried rice and chicken, yoghurt, papaya, melon',
      'mac and cheese',
      'croissants, chocolate covered ice cream',
      'Beef lok lak with rice, lucky chicken on french fries'
    ],
    entry: %(
Another travelling day - up at 6am, at Bangkok airport for 7am, flight to Phnom Penh at 9am, arrive
at 11.30am, bus to Kampot at 1.30pm for 3 hours. All in all, a good opportunity to make it
significantly further through our books and audiobook.

Arriving a Bangkok airport two hours before was a good idea. The place is _huge_ and there were a
lot of lines we needed to stand in. In addition, the airline we were flying with (Bangkok Airways,
"Asias Boutique Airline", apparently) has a private lounge for all its customers. Rosie got her free
tea and we both got our fill of free popcorn, pastry, buns and (bizarrely good) curry ham
sandwiches. They also included a free meal on our one hour flight. Not bad for $80.

We had to get visas on arrval in Phnom Penh, which was probably easier & cheaper than e-visas. We
caught the public bus from outside the airport for $1 (Cambodia uses its own currency, the riel,
interchangeably with dollars). Getting off relatively centrally, we made our way to one of the many
small private bus stations to find a bus (in this case minibus) to Kampot.

While waiting for the bus and on the bus itself we learnt that Cambodian roads are not like Thai
roads and definitely not like British roads. In Thailand, there's a pavement and you can maybe walk
on it about half of it, the rest of it being covered with street food carts, someone's moped or a
sleeping dog. If you want to cross a road, you walk slowly but deliberately across, maintaining a
constant speed, but still checking that cars or motorbikes will stop. In Cambodia, however, at least
in the bit of Phnom Penh we were in, there _may_ be pavement, but it doesn't have space for you.
Neither does the road beside the pavement - it's full of cars parked perpendicular to the pavement
even though the painted lines are diagonal. You end up walking in the road, into the oncoming sea
of motorbikes - many of the tuk-tuk-like vehicles here aren't actually a single piece, they're
just a motorbikes with a detachable trailer. If you want to cross the road you follow the same
procedure as Thailand, although seemingly fewer people are likely to stop for you.

Driving on larger roads seems to be different, too. Many of the larger roads in Thailand had
completely separate roads going either direction. Not so in Cambodia. There, it's completely normal
to overtake into oncoming traffic (as long as you sound your horn), meanwhile there's a good chance
that someone on a motorbike is undertaking the same vehicle you're overtaking.

After that somewhat exciting bus journey, we were taken by an old, dying tuk tuk to our booked
accommodation. It's a slightly bigger box than we've had so far, this time on stilts. The roof may
or may not be waterproof and the walls do not meet the roof - making it somewhat less private than
Rosie would like while changing. It does have a decent sized mosquito net, however, but with a fair
few holes. It's even got its own large gecko, patrolling parts of the ceiling. <R> I named him
Bertram.</R>
)
  },
  {
    date: '2018-01-28',
    number: 25,
    written: '2018-01-28 21:50',
    locations: [LOCATIONS[:Kampot]],
    expenses: {
      FOOD: { breakfast: { dollars: 4.25 }, lunch: { dollars: 2.75 }, dinner: { dollars: 18.75 } },
      ACCOMMODATION: { dollars: 6 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { kayak: { dollars: 10 } },
      OTHER: { laundry: { dollars: 5 } }
    },
    stats: {
      walked: 10,
      temperature: 28,
      altitude: 1,
      laundry: 4.5
    },
    food: [
      'banana and nutella pancake',
      'pineapple pie and kiwi ice cream',
      'hummus & flatbread, salad, falafel, pickle, beef kebab, french fries, onion, mozzarella',
      'banana & nutella milkshake'
    ],
    entry: %(
The combination of only partial walls in our room, nearby people's fondness for techno music and
a persistent car alarm meant that we lay in until about 9am. I had a massive banana pancake with a
generous helping of nutella before heading off towards the main own of Kampot.

We're staying across the river from the centre, so crossed back across the railway bridge. The
bridge itself does have a footpath across it as well as rails, but we needed to walk along a few
hundred metres of train track before and after. There were plenty of people doing the same thing, we
even saw a few motorbikes by the tracks the previous day. We learnt later in the day that there are
trains but rarely and fairly slow moving.

We wandered about Kampot, seeing the river and some of the odder Roundabout statues (eg, a giant
durian). We found a bookshop / cafe, which bought some of our finished books off of us. We had
pineapple pie and kiwi ice cream (the ice cream was better) at one of several "Kampot Pie & Ice
Cream Palaces" and listened to expats grumble. There seem to be a lot around . Most of the places
we've been so far have been filled with travellers around our own age, but Kampot (particularly our
accommodation) seems to have a lot of older single men living here long term.

We rented a kayak from our guest house, paddling up the river a bit, looking at birds and trying
(with little success) to pass an under-ripe mango between our paddles. After a cold shower, I tried
to catch up with this diary, then had a delicious dinner at a Lebanese restaurant. I know we're in
Cambdodia, but it was highly rated, it's still exploring different tastes, and they both have some
French influence. Plus I got a banana & nutella shake later (which definitely counts as Cambodian
fusion cuisine).

I finally caught up with the diary after dinner. It takes a surprisingly large amount of time and I
was 5 days behind ...
)
  },
  {
    date: '2018-01-29',
    number: 26,
    written: '2018-01-29 21:50',
    locations: [LOCATIONS[:Kampot], LOCATIONS[:Kep]],
    expenses: {
      FOOD: { breakfast: { dollars: 12.25 }, lunch: { dollars: 6 }, cocktails: { dollars: 5 }, dinner: { dollars: 27 } },
      ACCOMMODATION: { dollars: 6 },
      LONG_DISTANCE_TRAVEL: { tuk_tuk: { dollars: 20 } },
      SHORT_TRAVEL: {},
      ACTIVITIES: {},
      OTHER: { pepper: { dollars: 16.50 } }
    },
    stats: {
      walked: 5.3,
      temperature: 27,
      altitude: 1
    },
    food: [
      'french toast with sugar cane caramelized banana, breakfast shake (banana, peanut butter, honey, cinnamon, oats)',
      'banana shake and Kampot pepper ice cream',
      'salt and pepper popcorn, sunset cocktail',
      'tapas: lomos de orvo (pork), squid, tomato salad, bread, croquetes, sangria'
    ],
    entry: %(
It turns out our room did have a waterproof roof - at least, this morning's downpour didn't soak us.
We got up after it finished, paid and left, walking a mile or two into town with our rucksacks.
Rosie had found us an excellent breakfast restaurant and I had a fantastic meal of French toast and
bananas covered in sugar cane caramel. The baguettes they do here have much softer crusts than a
French baguette at home and lend themselves really well to French toast. The breakfast shake
(banana, peanut butter, honey, cinnamon, oats) may have been a bit much, but was interesting.

![Excellent French toast with caremalized banana](https://lh3.googleusercontent.com/Hce6Xt88CNTfMMpo5l_Ggr9ooSX6UuyMTdXd9okfWccYpUBbGtMKGv8jISgu-0rzaoNi5yKrRV4ER3Ul9CHX5pVWMcCL_7auK8IpKXgeWSYKWeg-IK1LjBSLbEOGJpF4_3o_tzIZTw)

Our main activity for the day was getting to Kep, another coastal town 15 - 20 miles away. We hopped
into a (remarkably comfy) tuk tuk and asked to stop at La Plantation, a pepper farm on the way. At
least, it wasn't particularly near by either Kampot or Kep, but close enough. We turned off the
tarmac road onto smaller, bumpier dirt tracks through currently empty rice paddies with the
occasional cow, pig or chicken and chicks. <R> I am not sure that Daniel is accurately describing
the feeling of being bounced along in the back of trailer concerned that at any moment the whole thing
could just collapse around you... but hey there were puppies everywhere so I was happy. </R>


Our driver stopped at a large building on the edge of a farm where we were able to get a (free!)
tour. La Plantation is run by a French and Belgian couple, growing primarily Kampot pepper, which
is one of the main products of the region. We saw plenty of it growing, along with specimens of
bananas, pineapples, papayas, passion fruit, turmeric and bird chillis. We also learnt the
differences between different pepper types and got to taste them all. We even tried Kamport pepper
ice cream, which, surprisingly, wasn't bad (at least in small amounts).

Afterwards, we went the rest of the way to Kep in our tuk tuk and checked in at our (nicer) hotel.
We wandered into town and had a cocktail at the local sailing club while watching the sunset. We had
dinner at a Spanish restaurant and probably witnessed a typical scene for a European expat living
out their dream of opening a small restaurant in South East Asia - everything a little bit too
hectic for him and the single other member of staff to handle, even with only three or four tables.
The water hadn't been working for the previous two days, but was now fixed, and half the food on the
menu wasn't actually available. The food itself was ok, not great, but it was fun to see and
slightly reminiscent of Fawlty Towers. We also got chatting to an Austrian couple who'd been
travelling a lot.

![Kep sunset cocktails](https://lh3.googleusercontent.com/F_X8iypM5NUhAtBabvkeeficq3mDcoJULuXd7SezhiDQFLbw11rvB8xvpuQ)

## Pepper types

* *Red*: ripe pepper picked, boiled & sundried
* *White*: peeled red pepper
* *Black*: not as ripe pepper picked when green, boiled & sundried
* *Long*: a different type of pepper, originally from Java rather than India. Shaped like a bumpy chilli (I prefer this one).
* *Pearl*: the seeds within the long pepper
)
  },
  {
    date: '2018-01-30',
    number: 27,
    written: '2018-01-30 22:10',
    locations: [LOCATIONS[:Kep]],
    expenses: {
      FOOD: { breakfast_and_lunch: { dollars: 14 }, drinks: { dollars: 4.5 }, cocktails_and_dinner: { dollars: 30.5 } },
      ACCOMMODATION: { dollars: 6 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { national_park: { dollars: 2 } },
      OTHER: { map: { dollars: 1.5 } }
    },
    stats: {
      walked: 13.2,
      temperature: 29,
      altitude: 207
    },
    food: [
      'mini croissants, mini pan au raisins, banana lassi, apricot tart, diplomat pastry',
      'watermelon juice',
      'cheese & chorizo baguette, bruschetta',
      'fried peanuts, deep water cocktail, crab nachos, olives, shrimp wantons, fritatta, spicy green mango, crab cakes, lime cheese cake, caramelized pineapple, lime sorbet'
    ],
    entry: %(
This morning we got up late (9.30am) and walked a mile or two into Kep, <R> (it was definetly two) </R>
which seems to have two centres. We had a breakfast of pastries at a French bakery and picked up food
for lunch. The main activity for the day was to be a walk, so we needed a bit of a picnic.

The walk was around Kep National Park - a small area of jungle-covered hillside just beside the sea.
We were given a map and quite a bit of useful advice at a cafe at the entrance to the park, then
made our way to a butterfly garden on the other side of the park.

We slowly walked up the wide path in the swelteringly hot and sticky mid day sun, enjoying the view
and the sight of the occasional bird or squirrel. After about twenty minutes, I heard a movement on
the edge of the path and turned to see a metre-long hooded snake lying motionless, watching us. I
quickly pointed it out to Rosie and we all paused for a second to work out how we can get away as
quickly and safely as possible. A tiny part of me was also trying to work out whether or when to
stop and take a photo. As I write this I've just looked up snakes in Cambodia and apparently a lot
of the hooded ones here are cobras, all of which can kill with a bite and some of which can spit
venom. So I'm fairly glad that we didn't stop to take a photo. It would have made it easier to
identify, though.

Seeing the snake did leave us a little on edge for the rest of the time in the national park, except
for in the butterfly garden. That was relaxing and tranquil (at least, once the loud group of
school boys left). There were loads of butterflies of plenty of different colours - bright blues and
oranges with speckles of red and brown. We spent a while taking photos, then left and had some cool
drinks in the shade. <R> it was just soooo hot </R>

The place where we had drinks had quite a few dogs, several of which followed / led us as we
continued our walk around the park. <R> I named them Blackie and Blondie and they were great
guides. </R> We turned off the main path onto a very steep and overgrown
trail through the jungle recommended by people from the cafe at the entrance. The dogs had far less
trouble than us and were somewhat reassuring company - they'd probably be much better at noticing
any other snakes. We ended up at a spectacular view point looking onto the two sea front centres of
Kep, separated by another jungle-covered hill, contemplating how great a starting point it would
make for a zipline.

Like yesterday, we finished with some cocktails watching the sunset, this time having tapas at the
same place (much better). The crab was particularly good and is what Kep is known for. I'm not
normally that into it, but here it was excellent. <R> Guys Daniel ate seafood three times in
one meal!!</R>
)
  },
  {
    date: '2018-01-31',
    number: 28,
    written: '2018-01-31 20:55',
    locations: [LOCATIONS[:Kep], LOCATIONS[:PhnomPenh]],
    expenses: {
      FOOD: { lunch: { dollars: 12 }, dinner: { dollars: 5 }, pudding_and_drinks: { dollars: 6.75 } },
      ACCOMMODATION: { dollars: 9 },
      LONG_DISTANCE_TRAVEL: { bus: { dollars: 12 } },
      SHORT_TRAVEL: {},
      ACTIVITIES: {},
      OTHER: { toiletries: { dollars: 5 } }
    },
    stats: {
      walked: 5.8,
      temperature: 31,
      altitude: 10
    },
    food: [
      'cookies',
      'nut brittle',
      'chicken fried rice, beef lok lak, banana shake',
      'mixed meat and seafood fried rice',
      'avocado shake, vanilla ice cream'
    ],
    entry: %(
The day started with a four or five hour bus journey from the peaceful emptiness of Kep to the hive
of activity that is Phnom Penh. It wasn't bad, pretty similar to our other daytime bus trips,
unfortunately without free water or snacks.

We arrived around 2pm, hungry and quickly very hot. We found our hostel, climbed the steep steps to
our top floor room to stow our bags, then headed out to find lunch. Afterwards, we focused on
finding a really nice restaurant for tomorrow's dinner - hopefully that will work out tomorrow.
Along the way, we saw the outside of the royal palace and monuments erected to the previous king and
independence from France. We also sat on the banks of the Mekong along with crowds of locals
(it's currently a public holiday), hoping to see the full moon (apparently a supermoon) rise, but
were thwarted by clouds.

We ate dinner at a little street food place - fried rice and seafood. It was a bit disappointing,
though - the smells outside the little foodstalls and tables were much better than the food tasted
and both dishes (surprisingly) contained baby octopus, which neither of us particularly like. We
made up for it with pudding and drinks down the road. The avocado milkshake was deliciously smooth,
with a subtle flavour, almost like drinking cream (not like I'd ever do _that_).
)
  },
  {
    date: '2018-02-01',
    number: 29,
    written: '2018-02-01 21:30',
    locations: [LOCATIONS[:PhnomPenh]],
    expenses: {
      FOOD: { breakfast: { dollars: 13 }, dinner: { dollars: 47.5 }, drinks: { dollars: 3.75 }, lunch: { dollars: 21 } },
      ACCOMMODATION: { dollars: 9 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: { tuk_tuk: { dollars: 14 } },
      ACTIVITIES: { killing_fields: { dollars: 12 } },
      OTHER: { postcards: { dollars: 3 } }
    },
    stats: {
      walked: 7.9,
      temperature: 31,
      altitude: 10
    },
    food: [
      'baked goods, banana shake',
      'beef lok lak, carmelized pear and blue cheese salad, banana shake',
      'vanilla milkshake',
      '65 degree egg & chorizo mayo, beef bourginon, chocolate & caramel lava pot'
    ],
    entry: %(
The main event for today was to visit the harrowing Choeung Ek Genocidal Centre
- one of the killing fields during Pol Pot's regime. I doubt I could describe
how awful and incomprehensible the history of the place is. Up to three million
people died during the regime, out of a total population of eight million.
Apparently, many of those who were executed were beaten to death because bullets
were expensive.

We didn't do too much in the afternoon, spending a bit of time during the
journey back getting to grips with what we'd just seen and heard and how it had
affected the country. We did small trip admin tasks - Rosie changed some of our
leftover foreign currency, we booked tomorrow's bus and we wrote a mountain of
postcards.

Dinner was at a French restaurant Rosie had found the day before. The plan was
to try somewhere upmarket and highly rated and hopefully have a fantastic meal.
The food was good, but not as good as we were hoping. It was about as good as a
decent restaurant in Edinburgh at almost the same price.
)
  },
  {
    date: '2018-02-02',
    number: 30,
    written: '2018-02-02 20:20',
    locations: [LOCATIONS[:PhnomPenh], LOCATIONS[:Kratie]],
    expenses: {
      FOOD: { breakfast: { riel: 7_500 }, dinner: { dollars: 18.75 }, lunch: { dollars: 8.75 } },
      ACCOMMODATION: { dollars: 6 },
      LONG_DISTANCE_TRAVEL: { bus: { dollars: 16 } },
      SHORT_TRAVEL: {},
      ACTIVITIES: {},
      OTHER: {}
    },
    stats: {
      walked: 3.5,
      temperature: 35,
      altitude: 10
    },
    food: [
      'donut',
      'strawberry yoghurt drink',
      'banana shake, carrot, pineapple, tomato & rice',
      'chicken bolognese crepe, creme caramel, mango shake'
    ],
    entry: %(
Another bus day. We were up early to get our 7.45am bus to Kratie.
Unfortunately, Rosie wasn't feeling so well, something a bus journey was
unlikely to help. Luckily, it didn't seem to make things much worse.

We arrived in Kratie six or seven hours later. It's a relatively small town, so
we were close to our guest house for the next two nights. We had a cheap lunch
at the guest house, then booked tomorrow's activity and the bus for the next
day. Then we planned a little bit of what we'll do in Chile and I caught up with
work emails again.

Rosie, despite not having much of an appetite, found an excellent place for
dinner. I had a surprisingly good main - chicken bolognese crepe. I saw it on
the menus of at least a couple of the restaurants here and it was intriguing.
Currently, I'm trying to set things up so that Rosie can add photos to this
site, which, like most programming tasks, is taking a little longer than
expected.
)
  },
  {
    date: '2018-02-03',
    number: 31,
    written: '2018-02-03 20:50',
    locations: [LOCATIONS[:Kratie]],
    expenses: {
      FOOD: { lunch: { dollars: 10 }, dinner: { dollars: 17.5 } },
      ACCOMMODATION: { dollars: 6 },
      LONG_DISTANCE_TRAVEL: {},
      SHORT_TRAVEL: {},
      ACTIVITIES: { kayak: { dollars: 16 } },
      OTHER: {}
    },
    stats: {
      walked: 3.1,
      temperature: 34,
      altitude: 10
    },
    food: [
      'pumpkin bread',
      'bamboo sticky rice, tiny oranges',
      'banana shake, four cheese pasta, margherita pizza',
      'vegetable spring rolls, honey sesame pork and rice, banana spring rolls'
    ],
    entry: %(
Our reason for coming to Kratie was to see the rare Irrawaddy dolphins. They're
an endangered species of river dolphin found only in the Mekong, with only 80 to
90 left. The largest group (about 20) are found near Kratie.

Down here, the Mekong is pretty massive. It's about 2km wide and must be wider
at times - apparently the water level rises by up to 15 metres during the rainy
season.

We started at a restaurant near our guest house at 7am with six other tourists
and two guides, then were driven 20km up river and got into our kayaks. They
weren't sit on tops this time, which was lucky because (a) it was hard work for
parts, so having something to push my knees against was good, and (b) getting in
the river was pretty rushed, so I didn't have time to sun cream my legs (my
lower inner thighs are burnt, however).

We paddled across the river, then down between lots of small sandy islands
covered in bushes, all of which must be submerged for months. We stopped on one
of these to go for a swim (the current was good fun to play in) and have a
snack. The guides gave us bamboo sticky rice - sticky rice cooked with soya
beans, coconut milk and a little sugar inside young bamboo. You peel the bamboo
off, leaving the rice covered in a bamboo paper that is edible.

While on the island, one of our guides told us of many of the tensions
surrounding the dolphins and their history. He said that before Pol Pot there
were around 3,000 of them, but afterwards many people fished the river and had
relatively easy access to explosives and electrocution equipment. This made
fishing easier, but killed dolphins, too. Now, there is foreign money invested
to protect the dolphins, which works, but has its own set of problems. People
on the west of the river resent that the money is spent on the east, where the
tourists go. People on the east are wary of corruption eats away some money
they would otherwise have access to.7cd

Next, we kayaked through a flooded forest. This was spectacular - large trees
dotted sparsely through the river, sometimes close enough together to cause the
water around them to speed up. A large amount of their root systems were
visible, making the whole place seem overgrown.

We emerged into a flat expanse with the occasional sand bank and struggled our
way back to the eastern side against the wind. We got a sense for just how
strong the wind and currents were. We saw a few local boats with small groups
of tourists on them, meaning we had arrived at the dolphin pool. Apparently the
dolphins prefer deep-water fish in that area of the Mekong, which is about 60m
deep, rather than the rest, which is mainly 10-15m (at the moment).

We spent a while paddling up stream, then floating down stream looking out for
dolphins. We saw quite a few, particularly towards the end. We saw the same pod
of four or five surface quite a few times, sometimes as close as about ten
metres.

We kayaked a bit further down river, then hauled the kayaks up the bank and
into the truck. We drove back, had a lacklustre lunch, but a decent dinner.
In between, we updated the site (taking advantage of reliable internet) and
watched the sunset.
)
  }
  # bus: 20
].freeze

def create_day(config)
  day = Day.find_or_create_by!(number: config[:number], date: config[:date])
  create_post(day, config[:entry], config[:written])
  create_expenses(day, config[:expenses])
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

def link_locations(day, locations)
  day.locations << locations
end

DAYS.each { |day_config| create_day day_config }
