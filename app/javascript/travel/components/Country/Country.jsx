import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import PhotoContainer from 'react-photo-container'

import { ConnectedMap } from '../Map/Map'
import { FoodCloud, parseFoodOccurrences } from '../FoodCloud/FoodCloud'
import { CostBreakdownTable } from '../Cost/CostBreakdown'
import { presentGroupedCosts } from '../Cost/CostPresenter'
import { LinkableDayFragment, DayLink } from '../DayLink/DayLink'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

import '../Cost/Cost.sass'

export const Country = ({ country }) => {
  if (!country) {
    return (
      <Grid>
        <Row>
          <Col xs={12}>
            We haven't been to this country yet (or possibly haven't uploaded
            any content from here yet).
          </Col>
        </Row>
      </Grid>
    )
  }
  return (
    <Grid>
      <Row>
        <Col xs={12} sm={6} md={4}>
          <h2>{country.name} ({country.days.length} days)</h2>

          <DayLink day={country.days[0]}>First Day</DayLink>
          &nbsp;-&nbsp;
          <DayLink day={country.days[country.days.length - 1]}>Last Day</DayLink>

          <h3>
            Average costs per day (${country.averageCosts.total.dollars})
          </h3>
          <div className="costChart">
            <div className="costChart--bars">
              <CostBreakdownTable costs={country.averageCosts} />
            </div>
          </div>
        </Col>
        <Col xs={12} sm={6} md={4}>
          <ConnectedMap filterCountry={country.name} />
        </Col>
      </Row>
      <Row>
        <Col xs={12}>
          <h3>Food</h3>
          <FoodCloud
            occurrences={country.foodOccurrences}
            fontScales={{ xs: 4, sm: 6, md: 7, lg: 9 }}
          />
        </Col>
      </Row>
    </Grid>
  )
}

export const ConnectedCountry = LoadFromServer({
  component: Country,
  query: `
    ${LinkableDayFragment}

    fragment AverageDollarPrice on TotalExpense {
      price: averagePricePerDay {
        dollars: convertTo(code: "USD") {
          amount
        }
      }
    }

    query country($countryName: String) {
      country(name: $countryName) {
        name

        days {
          edges {
            node {
              ...LinkableDay
            }
          }
        }

        foodOccurrences {
          name
          count
        }

        averageCosts: totalExpense {
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
    }
  `,
  propsToVariables: ({ match }) => ({
    countryName: match.params.countryName
  }),
  dataToProps: ({ country }) => {
    if (!country)
      return null
    return {
      country: {
        ...country,
        days: edgesToArray(country.days),
        foodOccurrences: parseFoodOccurrences(country.foodOccurrences),
        averageCosts: presentGroupedCosts(country.averageCosts)
      }
    }
  }
})



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
