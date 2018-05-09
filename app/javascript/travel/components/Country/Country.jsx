import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import PhotoContainer from 'react-photo-container'

import { ConnectedMap } from '../Map/Map'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Country = ({ country }) => (
  <Grid>
    <Row>
      <Col xs={12} sm={6} md={4}>
        <h2>{country.name}</h2>
      </Col>
      <Col xs={12} sm={6} md={4}>
        <ConnectedMap filterCountry={country.name} />
      </Col>
    </Row>
  </Grid>
)

export const ConnectedCountry = LoadFromServer({
  component: Country,
  query: `
    query country($countryName: String) {
      country(name: $countryName) {
        name
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
  dataToProps: ({ country }) => ({
    country
  })
})

