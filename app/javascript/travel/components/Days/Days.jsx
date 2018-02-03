import React from 'react'
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import { Row, Col } from 'react-bootstrap'

export const Days = ({ days, loading }) => {
  if (loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return (
      <div className="Days">
        <h1>Diary</h1>
        {days.map(day => (
          <Row key={day.number}>
            <Col xs={12}>
              <h2 className="Day--title">Day {day.number} - {day.date}</h2>
              <div>Written: {day.writtenAt}</div>
              <div className="content" dangerouslySetInnerHTML={{__html: day.post}} />
            </Col>
          </Row>
        ))}
      </div>
    )
  }
}

export const ConnectedDays = graphql(gql`
  query {
    days {
      edges {
        day: node {
          number
          date
          post {
            content
            writtenAt
          }
        }
      }
    }
  }
`, {
  props: ({ data: { days, loading } }) => ({
    loading,
    days: loading ? [] : days.edges.map(({ day }) => ({
      number: day.number,
      date: new Date(day.date).toString().substring(0, 15),
      post: day.post.content,
      writtenAt: new Date(day.post.writtenAt).toString().substring(0, 21)
    }))
  })
})(Days)

