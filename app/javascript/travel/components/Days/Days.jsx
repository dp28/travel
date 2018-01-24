import React from 'react'
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

export const Days = ({ days, loading }) => {
  if (loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return (
      <div className="Days">
        <h1>Diary</h1>
        <ul>
            {days.map(day => (
              <li key={day.number}>
                <h2 className="Day--title">Day {day.number} - {day.date}</h2>
                <div>Written: {day.writtenAt}</div>
                <div className="content" dangerouslySetInnerHTML={{__html: day.post}} />
              </li>
            ))}
        </ul>
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

