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

export const AverageDayCosts = `
  fragment AverageDollarPrice on TotalExpense {
    price: averagePricePerDay {
      dollars: convertTo(code: "USD") {
        amount
      }
    }
  }

  query {
    averages: totalExpense {
      ...AverageDollarPrice
      food: withinCategory(category: "FOOD") {
        ...AverageDollarPrice
      }
      accommodation: withinCategory(category: "ACCOMMODATION") {
        ...AverageDollarPrice
      }
      activities: withinCategory(category: "ACTIVITIES") {
        ...AverageDollarPrice
      }
      shortTravel: withinCategory(category: "SHORT_TRAVEL") {
        ...AverageDollarPrice
      }
      longTravel: withinCategory(category: "LONG_DISTANCE_TRAVEL") {
        ...AverageDollarPrice
      }
      other: withinCategory(category: "OTHER") {
        ...AverageDollarPrice
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
