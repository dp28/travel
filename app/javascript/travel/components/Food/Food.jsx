import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'

import { ConnectedFoodCloud } from '../FoodCloud/FoodCloud'

export const Food = () => (
  <Grid>
    <Row>
      <Col xs={12}>
        <h1>Food</h1>
        <p>
          Food is one of the things we're most interested in on our travels, so
          here is a bit of an overview of the kind of things we've been eating
          and drinking (and how often).
        </p>
        <ConnectedFoodCloud fontScales={{ xs: 1.2, sm: 2.5, md: 3, lg: 3.5 }} />
      </Col>
    </Row>
  </Grid>
)
