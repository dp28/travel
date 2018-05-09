import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import PhotoContainer from 'react-photo-container'
import { Link } from 'react-router-dom'

import { ConnectedMap } from '../Map/Map'
import { ConnectedTimeline } from '../Timeline/Timeline'
import { DayLink, LinkableDayFragment } from '../DayLink/DayLink'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Day = ({ day, previousLink, nextLink }) => (
  <Grid>
    <Row>
      <Col xs={12}>
        <ConnectedTimeline selectedDay={day.number} />
      </Col>
    </Row>
    <Row>
      <Col xs={12} sm={6} md={8}>
        <h2>Day {day.number} - {day.date}</h2>
        <p>
          {previousLink} - {nextLink}
        </p>
        <p>
          {day.countryNames.length > 1 ? 'Countries: ' : 'Country: '}
          {
            day.countryNames.map(countryName => (
              <span style={{ paddingRight: '5px'}} key={countryName}>
                <Link to={`/countries/${countryName}`}>
                  {countryName}
                </Link>
              </span>
            ))
          }
        </p>
        <div dangerouslySetInnerHTML={{__html: day.post}} />
      </Col>
      <Col xs={12} sm={6} md={4}>
        <ConnectedMap selectedDayNumber={day.number} />
      </Col>
      <Col xs={12}>
        {day.photos.length === 0 ? null : (
          <PhotoContainer
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
    ${LinkableDayFragment}

    query day($dayNumber: Int, $previous: Int, $next: Int) {
      day(number: $dayNumber) {
        number
        date

        post {
          content
        }

        locations {
          edges {
            node {
              area {
                country {
                  name
                }
              }
            }
          }
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
        ...LinkableDay
      }
      next: day(number: $next) {
        ...LinkableDay
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
      photos: edgesToArray(day.photos),
      countryNames: edgesToArray(day.locations).map(location => location.area.country.name)
    },
    previousLink: buildOptionalLink(previous, 'Previous'),
    nextLink: buildOptionalLink(next, 'Next')
  })
})

function buildOptionalLink(day, text) {
  if (day) {
    return <DayLink day={day}>{text}</DayLink>
  }
  else {
    return <span>{text}</span>
  }
}

