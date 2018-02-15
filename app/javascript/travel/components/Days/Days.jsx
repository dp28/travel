import React from 'react'
import { Row, Col } from 'react-bootstrap'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Days = ({ days }) => (
  <div className="Days">
    <h1>Diary</h1>
    {days.map(day => (
      <Row key={day.number}>
        <Col xs={12}>
          <h2 className="Day--title">Day {day.number} - {day.date}</h2>
          <div className="content" dangerouslySetInnerHTML={{__html: day.post}} />
        </Col>
      </Row>
    ))}
  </div>
)

export const ConnectedDays = LoadFromServer({
  component: Days,
  query: `
    query {
      days {
        edges {
          node {
            number
            date
            post {
              content
            }
          }
        }
      }
    }
  `,
  dataToProps: ({ days }) => ({
    days: edgesToArray(days).map(day => ({
      number: day.number,
      date: new Date(day.date).toString().substring(0, 15),
      post: day.post.content
    }))
  })
})

