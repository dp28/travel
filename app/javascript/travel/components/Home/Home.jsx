import React from 'react'
import { Row, Col } from 'react-bootstrap'

import { ConnectedDays } from '../Days/Days'
import { ConnectedMap } from '../Map/Map'

export const Home = () => (
  <Row>
    <Col xs={12}>
      <ConnectedMap />
    </Col>
    <Col xs={12}>
      <ConnectedDays />
    </Col>
  </Row>
)
