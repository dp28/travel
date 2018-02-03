import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'

import { ConnectedReleases } from '../Releases/Releases'
import { ConnectedDays } from '../Days/Days'
import { About } from '../About/About'
import { Navigation } from '../Navigation/Navigation'

export const App = () => (
  <div>
    <Navigation />
    <Grid>
      <Row>
        <Col xs={12} sm={8} md={9}>
          <About />
        </Col>
        <Col xs={12} sm={4} md={3}>
          <ConnectedReleases />
        </Col>
      </Row>
      <Row>
        <Col xs={12}>
          <ConnectedDays />
        </Col>
      </Row>
    </Grid>
  </div>
)
