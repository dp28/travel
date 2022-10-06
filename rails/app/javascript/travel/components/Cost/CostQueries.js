import { LinkableDayFragment } from '../DayLink/DayLink'

export const TotalExpenseDollarPriceFragment = `
  fragment DollarPrice on TotalExpense {
    price {
      dollars: convertTo(code: "USD") {
        amount
      }
    }
  }
`

export const DayCostFragment = `
  ${TotalExpenseDollarPriceFragment}

  fragment DayCost on Day {
    totalExpense {
      ...DollarPrice
      food: withinCategory(category: "FOOD") {
        ...DollarPrice
      }
      accommodation: withinCategory(category: "ACCOMMODATION") {
        ...DollarPrice
      }
      activities: withinCategory(category: "ACTIVITIES") {
        ...DollarPrice
      }
      shortTravel: withinCategory(category: "SHORT_TRAVEL") {
        ...DollarPrice
      }
      longTravel: withinCategory(category: "LONG_DISTANCE_TRAVEL") {
        ...DollarPrice
      }
      other: withinCategory(category: "OTHER") {
        ...DollarPrice
      }
    }
  }
`

export const AllDayCosts = `
  ${DayCostFragment}

  query AllDayCosts {
    days {
      edges {
        node {
          number
          ...DayCost
        }
      }
    }
  }
`

export const SingleDayCosts = `
  ${DayCostFragment}
  ${LinkableDayFragment}

  query day($dayNumber: Int) {
    day(number: $dayNumber) {
      ...LinkableDay
      ...DayCost
    }
  }
`
