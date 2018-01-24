import React from 'react'
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

export const Days = ({ days, loading }) => {
  if (loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return (
      <ul className="Days">
          {days.map(day => (
            <li key={day.number}>
              <h2 className="Day--title">Day {day.number}</h2>
              <div className="content" dangerouslySetInnerHTML={{__html: day.post.content}} />
            </li>
          ))}
      </ul>
    )
  }
}

export const ConnectedDays = graphql(gql`
  query {
    days {
      edges {
        node {
          number
          post {
            content
          }
        }
      }
    }
  }
`, {
  props: ({ data: { days, loading } }) => ({
    loading,
    days: loading ? [] : days.edges.map(edge => edge.node)
  })
})(Days)

