import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import { Link } from 'react-router-dom'
import Gallery from 'react-photo-container'

import { ConnectedMap, SELECTED_AREA_PARAM } from '../Map/Map'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Day = ({ day, previousLink, nextLink }) => (
  <Grid>
    <Row>
      <Col xs={12} sm={6} md={8}>
        <h2>Day {day.number} - {day.date}</h2>
        <p>
          {previousLink} - {nextLink}
        </p>
        <div dangerouslySetInnerHTML={{__html: day.post}} />
      </Col>
      <Col xs={12} sm={6} md={4}>
        <ConnectedMap selectedDayNumber={day.number} />
      </Col>
      <Col xs={12}>
        {day.photos.length === 0 ? null : (
          <Gallery
            photos={
              day.photos.map(({ url, width, height, caption, aspectRatio }) => ({
                src: url,
                width,
                height,
                aspectRatio,
                lightboxImage: { src: url, caption }
            }))} />
        )}
      </Col>
    </Row>
  </Grid>
)

export const ConnectedDay = LoadFromServer({
  component: Day,
  query: `
    query day($dayNumber: Int, $previous: Int, $next: Int) {
      day(number: $dayNumber) {
        number
        date
        post {
          content
        }
        photos {
          edges {
            node {
              url
              width
              height
              aspectRatio
              caption
            }
          }
        }
      }
      previous: day(number: $previous) {
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
      next: day(number: $next) {
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
    }
  `,
  propsToVariables: ({ match }) => {
    const dayNumber = Number(match.params.number)
    return {
      dayNumber,
      previous: dayNumber - 1,
      next: dayNumber + 1
    }
  },
  dataToProps: ({ day, previous, next }) => ({
    day: !day ? null : {
      number: day.number,
      date: new Date(day.date).toString().substring(0, 15),
      post: day.post.content,
      photos: edgesToArray(day.photos)
    },
    previousLink: buildOptionalLink(previous, 'Previous'),
    nextLink: buildOptionalLink(next, 'Next')
  })
})

function buildOptionalLink(day, text) {
  if (day) {
    console.log(day)
    const area = encodeURIComponent(day.locations.edges[0].node.area.name)
    return <Link to={`/days/${day.number}?${SELECTED_AREA_PARAM}=${area}`}>{text}</Link>
  }
  else {
    return <span>{text}</span>
  }
}

