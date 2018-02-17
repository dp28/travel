import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import Gallery from 'react-photo-container'

import { ConnectedMap } from '../Map/Map'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Day = ({ day }) => (
  <Grid>
    <Row>
      <Col xs={12}>
        <ConnectedMap selectedDayNumber={day.number} />
      </Col>
      <Col xs={12}>
        <h2>Day {day.number} - {day.date}</h2>
        <div dangerouslySetInnerHTML={{__html: day.post}} />
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
    query day($number: Int) {
      day(number: $number) {
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
    }
  `,
  propsToVariables: ({ match }) => ({ number: Number(match.params.number) }),
  dataToProps: ({ day }) => ({
    day: !day ? null : {
      number: day.number,
      date: new Date(day.date).toString().substring(0, 15),
      post: day.post.content,
      photos: edgesToArray(day.photos)
    }
  })
})

