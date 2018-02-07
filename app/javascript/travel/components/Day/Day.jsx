import React from 'react'
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';
import { Grid, Row, Col } from 'react-bootstrap'

export const Day = ({ day, loading }) => {
  if (loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return (
      <Grid>
        <Row key={day.number}>
          <Col xs={12}>
            <h2>Day {day.number} - {day.date}</h2>
            <div dangerouslySetInnerHTML={{__html: day.post}} />
          </Col>
        </Row>
      </Grid>
    )
  }
}

export const ConnectedDay = graphql(gql`
  query day($number: Int) {
    day(number: $number) {
      number
      date
      post {
        content
      }
    }
  }
`, {
  options: ({ match }) => ({ variables: { number: Number(match.params.number) }}),
  props: ({ data: { day, loading } }) => ({
    loading,
    day: !day ? null : {
      number: day.number,
      date: new Date(day.date).toString().substring(0, 15),
      post: day.post.content
    }
  })
})(Day)

