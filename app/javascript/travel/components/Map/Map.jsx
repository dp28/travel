import React from 'react'
import GoogleMap from 'google-map-react'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { QueryParamLink, PathLink, getQueryParamValue } from '../Links/Links'
import { edgesToArray } from '../../mapGraphqlResults'
import './Map.sass'

const DEFAULT_CENTRE = {
  lat: 15,
  lng: 102
}

export const SELECTED_AREA_PARAM = 'area'

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



export const Map = ({ areas, selectedDayNumber, centreArea, zoom }) => {
  const selectedAreaName = getQueryParamValue(SELECTED_AREA_PARAM)
  const centreAreaName = selectedAreaName || centreArea
  const centre = areas.find(area => area.name === centreAreaName)
  const centreLocation = centre ? centre.location : DEFAULT_CENTRE
  return (
    <div className="Map">
      <GoogleMap
        center={centreLocation}
        zoom={zoom || 6}
        bootstrapURLKeys={{
          key: 'AIzaSyDymbrPc713fzhSFmB6F2Ap99fW3y_tYos'
        }}>
        {
          (areas || []).map(area => (
            <Area
              key={area.name}
              {...area}
              {...area.location}
              selected={selectedAreaName === area.name}
              selectedDayNumber={selectedDayNumber}
            />
          ))
        }
      </GoogleMap>
    </div>
  )
}

export const ConnectedMap = LoadFromServer({
  component: Map,
  query: `
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
  `,
  dataToProps: ({ areas }) => ({
    areas: edgesToArray(areas).map(parseArea)
  })
})

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

