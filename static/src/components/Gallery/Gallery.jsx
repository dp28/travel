import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import PhotoContainer from 'react-photo-container'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Gallery = ({ photos }) => (
  <Grid>
    <Row>
      <Col xs={12}>
        <h2>Gallery</h2>
        {photos.length === 0 ? null : <PhotoContainer photos={photos} />}
      </Col>
    </Row>
  </Grid>
)

export const ConnectedGallery = LoadFromServer({
  component: Gallery,
  query: `
    query photos {
      photos(isFavourite: true) {
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
  `,
  dataToProps: ({ photos }) => ({
    photos: edgesToArray(photos).map(({ url, width, height, caption, aspectRatio }) => ({
      src: url,
      width,
      height,
      aspectRatio,
      lightboxImage: { src: url, caption }
    }))
  })
})

