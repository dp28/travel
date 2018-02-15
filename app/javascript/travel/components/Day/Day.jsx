import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'

import { ConnectedMap } from '../Map/Map'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'

export const Day = ({ day, loading }) => (
  <Grid>
    <Row>
      <Col xs={12}>
        <ConnectedMap selectedDayNumber={day.number} />
      </Col>
      <Col xs={12}>
        <h2>Day {day.number} - {day.date}</h2>
        <div dangerouslySetInnerHTML={{__html: day.post}} />
      </Col>
    </Row>
  </Grid>
)

export const ConnectedDay = LoadFromServer({
  component: Day,
  query: `
    query day($number: Int) {
      day(number: $number) {
        number
        date
        post {
          content
        }
      }
    }
  `,
  propsToVariables: ({ match }) => ({ number: Number(match.params.number) }),
  dataToProps: ({ day }) => ({
    day: !day ? null : {
      number: day.number,
      date: new Date(day.date).toString().substring(0, 15),
      post: day.post.content
    }
  })
})

