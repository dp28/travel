import React from 'react'
import { Row, Col } from 'react-bootstrap'

import { ConnectedReleases } from '../Releases/Releases'

export const About = () => (
  <Row>
    <Col xs={12} sm={8} md={9}>
      <img src='https://lh3.googleusercontent.com/b6vSe_BP5bqZ3Kd_UiIaIVnT67T9DYqcfF7ekZO2QoA-673s4w1z--SudT_oczNNPxGrJjej5xxdA_Km41ibXJO2BgxXEOheBFFHVcKj94aVG2tuDIdeLf6oXNeQu5xQdAKX3GohxKg' />

      <h2>About the trip</h2>
      <p>
        This trip has been on the cards for a long time. We were both interested in travelling at
        some point after leaving university, looking to see some new places and find some delicious
        food. The rough plan for our six month trip is:
      </p>
      <ol>
        <li>Thailand</li>
        <li>Laos</li>
        <li>Cambodia</li>
        <li>Vietnam</li>
        <li>Malaysia</li>
        <li>Indonesia</li>
        <li>Australia</li>
        <li>Argentina</li>
        <li>Chile</li>
        <li>Bolivia</li>
        <li>Peru</li>
        <li>Ecuador</li>
      </ol>

    </Col>
    <Col xs={12} sm={4} md={3}>
      <ConnectedReleases />
    </Col>
  </Row>
)

