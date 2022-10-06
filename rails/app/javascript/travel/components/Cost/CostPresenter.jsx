import { edgesToArray } from '../../mapGraphqlResults'


export function presentAllDayCosts({ days }) {
  const dayNodes = edgesToArray(days)

  if (dayNodes.length === 0) {
    return {
      days: [],
      axis: null
    }
  }

  const maxCost = calculateMaxCost(dayNodes)
  const scaleCostToPercent = cost => ((cost * 100) / maxCost)

  const presentedDays = dayNodes.map(day => presentDay(day, scaleCostToPercent))
  return {
    days: presentedDays,
    axis: buildAxis(maxCost, scaleCostToPercent)
  }
}

export function presentGroupedCosts(groupedCosts) {
  const maxIndividualCost = calculateMaxCostForGroupedCosts(groupedCosts)
  const scaleCostToPercent = cost => (100 * cost) / maxIndividualCost
  return presentCosts(groupedCosts, scaleCostToPercent)
}

function calculateMaxCostForGroupedCosts(groupedCosts) {
  const costs = [
    groupedCosts.food,
    groupedCosts.accommodation,
    groupedCosts.activities,
    groupedCosts.shortTravel,
    groupedCosts.longTravel,
    groupedCosts.other
  ]
  return Math.max(...costs.map(toDollars))
}

function calculateMaxCost(dayNodes) {
  const totalCosts = dayNodes.map(({ totalExpense }) => totalExpense.price.dollars.amount)
  return Math.max(...totalCosts)
}

function presentDay({ number, totalExpense }, scaleCostToPercent) {
  return {
    number,
    costs: presentCosts(totalExpense, scaleCostToPercent)
  }
}

function presentCosts(costs, scaleCostToPercent) {
  const { price, food, accommodation, activities, shortTravel, longTravel, other } = costs
  return {
    food: presentCost(food, scaleCostToPercent),
    accommodation: presentCost(accommodation, scaleCostToPercent),
    activities: presentCost(activities, scaleCostToPercent),
    shortTravel: presentCost(shortTravel, scaleCostToPercent),
    longTravel: presentCost(longTravel, scaleCostToPercent),
    other: presentCost(other, scaleCostToPercent),
    total: presentCost({ price }, scaleCostToPercent)
  }
}

function presentCost(hasPrice, scaleCostToPercent) {
  const dollars = toDollars(hasPrice)
  return {
    dollars,
    widthInPercent: scaleCostToPercent(dollars)
  }
}

function toDollars({ price }) {
  return price.dollars.amount
}

function buildAxis(maxCost, scaleCostToPercent) {
  const lineValues = calculateAxisLineValues(maxCost)
  return {
    lines: lineValues.map(value => buildLine(scaleCostToPercent, value))
  }
}

function buildLine(scaleCostToPercent, valueInDollars) {
  return {
    valueInDollars,
    positionInPercent: scaleCostToPercent(valueInDollars)
  }
}

function calculateAxisLineValues(maxCost) {
  const flooredMaxCost = Math.floor(maxCost)
  const step = calculateStep(flooredMaxCost)
  const lineValues = range({ step, end: maxCost, inclusive: maxCost === flooredMaxCost })
  return lineValues
}

function calculateStep(flooredMaxCost) {
  if (flooredMaxCost <= 4) {
    return 1
  }
  if (flooredMaxCost <= 8) {
    return 2
  }
  if (flooredMaxCost <= 20) {
    return 5
  }
  if (flooredMaxCost <= 40) {
    return 10
  }
  if (flooredMaxCost <= 100) {
    return 25
  }
  if (flooredMaxCost <= 200) {
    return 50
  }
  if (flooredMaxCost <= 400) {
    return 100
  }
  return 250
}

function range({ end, start = 0, inclusive = false, step = 1 }) {
  let result = []
  for(; start < end || (inclusive && start === end); start += step) {
    result.push(start)
  }
  return result
}
