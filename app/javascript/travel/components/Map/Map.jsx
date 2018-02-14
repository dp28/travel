import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'
import GoogleMap from 'google-map-react'
import { Link } from 'react-router-dom'
import queryString from 'query-string'

import './Map.sass'

const DEFAULT_CENTRE = {
  lat: 15,
  lng: 102
}

const SELECTED_AREA_PARAM = 'area'

const QueryParamLink = ({ param, value, children }) =>  {
  const currentPath = window.location.pathname
  return (
    <Link to={`${currentPath}?${param}=${value}`} >
      {children}
    </Link>
  )
}

const PathLink = ({ path, children }) => (
  <Link to={`${path}${window.location.search}`}>{children}</Link>
)

const Area = ({ name, dayNumbers, selectedDayNumber, selected }) => {
  const title = `${name} (${dayNumbers.length} days)`
  if (selected) {
    return (
      <div className="Area selected">
        <div className="Area--centre Area--dot selected" />
        <div className="Area--title">{title}</div>
        {
          dayNumbers.map(number => (
            <div
              key={number}
              className={`DaySelector Area--dot ${number === selectedDayNumber ? 'selected' : ''}`}
              title={`Day ${number} - ${name}`}
            >
              <PathLink path={`/days/${number}`}>{number}</PathLink>
            </div>
          ))
        }
      </div>
    )
  }
  else {
    return (
      <div className="Area">
        <QueryParamLink param={SELECTED_AREA_PARAM} value={name}>
          <div className="Area--centre Area--dot" title={title} />
        </QueryParamLink>
      </div>
    )
  }
}



export const Map = ({ areas, loading, selectedDayNumber }) => {
  if (loading) {
    return <div>Loading ...</div>
  }
  const selectedArea = queryString.parse(location.search)[SELECTED_AREA_PARAM]
  return (
    <div className="Map">
      <GoogleMap
        center={DEFAULT_CENTRE}
        zoom={5}
        bootstrapURLKeys={{
          key: 'AIzaSyDymbrPc713fzhSFmB6F2Ap99fW3y_tYos'
        }}>
        {
          (areas || []).map(area => (
            <Area
              key={area.name}
              {...area}
              {...area.location}
              selected={selectedArea === area.name}
              selectedDayNumber={selectedDayNumber}
            />
          ))
        }
      </GoogleMap>
    </div>
  )
}

export const ConnectedMap = graphql(gql`
  query areas {
    areas {
      edges {
        node {
          name
          days {
            edges {
              node {
                number
              }
            }
          }
          locations(first: 1) {
            edges {
              node {
                latitude
                longitude
              }
            }
          }
        }
      }
    }
  }
`, { props: mapProps })(Map)

function mapProps({ data: { areas, loading } }) {
  if (loading) {
    return { loading, areas: [] };
  }
  return {
    loading, areas: edgesToArray(areas).map(parseArea)
  }
}

function parseArea({ name, days, locations }) {
  const location = edgesToArray(locations)[0]
  return {
    name,
    dayNumbers: edgesToArray(days).map(day => day.number).sort((a, b) => a - b),
    location: {
      lat: location.latitude,
      lng: location.longitude
    }
  }
}

function edgesToArray({ edges }) {
  return edges.map(({ node }) => node)
}

