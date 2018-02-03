import React from 'react'
import { Row, Col } from 'react-bootstrap'

import { ConnectedDays } from '../Days/Days'

export const Home = () => (
  <Row>
    <Col xs={12}>
      <ConnectedDays />
    </Col>
  </Row>
)
