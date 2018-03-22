import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import { Link } from 'react-router-dom'

import { ConnectedMap } from '../Map/Map'
import { DayLink } from '../DayLink/DayLink'
import { edgesToArray } from '../../mapGraphqlResults'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'

export const Home = ({ firstDay, mostRecentDay }) => (
  <Grid>
    <Row>
      <Col xs={12} md={6}>
        <ConnectedMap centreArea={edgesToArray(mostRecentDay.locations)[0].area.name} zoom={4} />
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
          <li>
            A way of making sure I don't become too rusty a programmer over the next six months
          </li>
        </ol>

        <p>
          The site and its content will hopefully be significantly updated over the coming months as
          we write more diary entries and add more functionality. You can read the diary from
          &nbsp;
          <DayLink day={firstDay}>the start</DayLink>
          &nbsp;
          or skip to
          &nbsp;
          <DayLink day={mostRecentDay}>the most recently added day</DayLink>.
        </p>
        <div className="Rosie">
          <h2>From Rosie</h2>
          <p>
            Hi, I'm Rosie and I approve this message.
          </p>
          <p>
            I'm in charge of sarcastic comments, <Link to="/gallery">photos</Link> and <Link to="/videos">videos</Link>.
          </p>
        </div>
      </Col>
    </Row>
  </Grid>
)

export const ConnectedHome = LoadFromServer({
  component: Home,
  query: `
    fragment DayFirstLocation on Day {
      number
      locations(first: 1) {
        edges {
          node {
            area {
              name
            }
          }
        }
      }
    }
    query {
      firstDay: day(number: 1) {
        ...DayFirstLocation
      }
      mostRecentDays: days(last: 1) {
        edges{
          node {
            ...DayFirstLocation
          }
        }
      }
    }
  `,
  dataToProps: ({ firstDay, mostRecentDays }) => {
    if (!firstDay) {
      return {}
    }
    return {
      firstDay,
      mostRecentDay: edgesToArray(mostRecentDays)[0]
    }
  }
})
