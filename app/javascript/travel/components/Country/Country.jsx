import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import PhotoContainer from 'react-photo-container'

import { ConnectedMap } from '../Map/Map'
import { LinkableDayFragment, DayLink } from '../DayLink/DayLink'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

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
        </Col>
        <Col xs={12} sm={6} md={4}>
          <ConnectedMap filterCountry={country.name} />
        </Col>
      </Row>
    </Grid>
  )
}

export const ConnectedCountry = LoadFromServer({
  component: Country,
  query: `
    ${LinkableDayFragment}

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
        days: edgesToArray(country.days)
      }
    }
  }
})

