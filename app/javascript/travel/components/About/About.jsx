import React from 'react'
import { Row, Col } from 'react-bootstrap'

import { ConnectedReleases } from '../Releases/Releases'

export const About = () => (
  <Row>
    <Col xs={12} sm={8} md={9}>
      <h2>From Daniel</h2>
      <p>
        If you're here, you probably know me. If not, hi - I'm Daniel Patterson a
        26 year old software developer currently travelling in South East Asia and
        South America for six months with my girlfriend, Rosie.
      </p>

      <p>
        This site is essentially:
      </p>

      <ol>
        <li>My diary</li>
        <li>A way of letting friends & family know what I'm up to</li>
        <li>A way of making sure I don't become too rusty a programmer over the next six months</li>
      </ol>

      <p>
        The site and it's content will hopefully be significantly updated over the coming months as I
        write more diary entries and add more functionality.
      </p>

      <div className="Rosie">
        <h2>From Rosie</h2>
        <p>
          Hi, I'm Rosie and I approve this message.
        </p>
      </div>
    </Col>
    <Col xs={12} sm={4} md={3}>
      <ConnectedReleases />
    </Col>
  </Row>
)

