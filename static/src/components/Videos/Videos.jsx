import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import YouTube from 'react-youtube'

const VideoIds = ['PjMru8mq0z0', '4LVJa0bon3A', '1EecWT70ycI', 'YkGeKMfFZ8I']

export const Videos = () => (
  <Grid>
    <Row>
      <Col xs={12}>
        <h2>Videos</h2>
      </Col>
    </Row>
    {
      VideoIds.map(id => (
        <Row key={id}>
          <Col xs={12}>
             <YouTube videoId={id} />
          </Col>
        </Row>
      ))
    }
  </Grid>
)
