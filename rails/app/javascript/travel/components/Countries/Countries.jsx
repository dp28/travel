import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import { Link } from 'react-router-dom'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Countries = ({ countries }) => (
  <Grid>
    <Row>
      <Col xs={12}>
        <h2>Countries visited on the trip</h2>
        {
          countries.map(country => (
            <div key={country.name}>
              <h3>
                <Link to={`/countries/${country.name}`}>
                  <span
                    style={{
                      display: 'inline-block',
                      width: '50px',
                      height: '50px',
                      border: '1px solid #444',
                      borderRadius: '100px',
                      background: `url('/flags/${country.name}.svg') no-repeat center`,
                      backgroundSize: '90px',
                      verticalAlign: 'middle',
                      marginRight: '5px'
                    }}
                  />
                  <span style={{ verticalAlign: 'middle' }}>{country.name}</span>
                </Link>
              </h3>
              {
                country.photo && (
                  <img
                    src={country.photo.url}
                    style={{
                      width: `${country.photo.width}px`,
                      height: `${country.photo.height}px`
                    }}
                  />
                )
              }
            </div>
          ))
        }
      </Col>
    </Row>
  </Grid>
)

export const ConnectedCountries = LoadFromServer({
  component: Countries,
  query: `
    query countries {
      countries {
        edges {
          node {
            name

            days {
              edges {
                node {
                  photos {
                    edges {
                      node {
                        url
                        aspectRatio
                        isFavourite
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  `,
  dataToProps: ({ countries }) => {
    if (!countries)
      return { countries: [] }
    return {
      countries: edgesToArray(countries).map(country => ({
        name: country.name,
        photo: selectRandomFavouritePhoto(country)
      }))
    }
  }
})

function selectRandomFavouritePhoto({ days }) {
  const photos = edgesToArray(days).reduce(
    (allPhotos, day) => allPhotos.concat(edgesToArray(day.photos).filter(p => p.isFavourite)),
    []
  )
  const randomIndex = Math.floor(Math.random() * photos.length)
  return appendPhotoSizes(photos[randomIndex])
}

const PHOTO_HEIGHT = 400

function appendPhotoSizes(photo) {
  if (!photo)
    return null
  return {
    url: photo.url,
    height: PHOTO_HEIGHT,
    width: PHOTO_HEIGHT * photo.aspectRatio
  }
}
