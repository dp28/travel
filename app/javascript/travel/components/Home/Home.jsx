import React from 'react'
import { Row, Col } from 'react-bootstrap'
import { Link } from 'react-router-dom'

import { ConnectedMap } from '../Map/Map'

export const Home = () => (
  <Row>
    <Col xs={12} md={6}>
      <ConnectedMap />
    </Col>
    <Col xs={12} md={6}>
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
        <li>My diary while travelling </li>
        <li>A way of letting friends & family know what I'm up to</li>
        <li>A way of making sure I don't become too rusty a programmer over the next six months</li>
      </ol>

      <p>
        The site and its content will hopefully be significantly updated over the coming months as
        we write more diary entries and add more functionality. The diary starts &nbsp;
        <Link to="/days/1?area=Bangkok">here</Link>.
      </p>
      <div className="Rosie">
        <h2>From Rosie</h2>
        <p>
          Hi, I'm Rosie and I approve this message.
        </p>
      </div>
    </Col>
  </Row>
)
