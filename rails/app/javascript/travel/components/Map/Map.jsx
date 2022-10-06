import React from 'react'
import GoogleMap from 'google-map-react'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { QueryParamLink, PathLink, getQueryParamValue } from '../Links/Links'
import { edgesToArray } from '../../mapGraphqlResults'
import './Map.sass'

export const SELECTED_AREA_PARAM = 'area'

const Area = ({ name, dayNumbers, selectedDayNumber, selected }) => {
  const title = buildTitle(name, dayNumbers.length)
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



export const Map = ({ areas, selectedDayNumber, centreArea, zoom, filterCountry }) => {
  const areasToPlot = filterAreasToPlot(areas, filterCountry)
  const selectedAreaName = getQueryParamValue(SELECTED_AREA_PARAM)
  const centreLocation = calculateCentreLocation(areasToPlot, selectedAreaName, centreArea)
  return (
    <div className="Map">
      <GoogleMap
        center={centreLocation}
        zoom={zoom || 6}
        bootstrapURLKeys={{
          key: 'AIzaSyDymbrPc713fzhSFmB6F2Ap99fW3y_tYos'
        }}>
        {
          (areasToPlot || []).map(area => (
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
            country {
              name
            }
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

function parseArea({ name, country, days, locations }) {
  const location = edgesToArray(locations)[0]
  return {
    name,
    countryName: country.name,
    dayNumbers: edgesToArray(days).map(day => day.number).sort((a, b) => a - b),
    location: {
      lat: location.latitude,
      lng: location.longitude
    }
  }
}

function filterAreasToPlot(areas = [], filterCountry) {
  return filterCountry ? areas.filter(area => area.countryName === filterCountry) : areas
}

function calculateCentreLocation(areas, selectedAreaName, centreAreaName) {
  const selectedName = selectedAreaName || centreAreaName
  const selectedCentre = selectedName && areas.find(area => area.name === selectedName)
  return selectedCentre ? selectedCentre.location : calculateMeanLocation(areas)
}

function calculateMeanLocation(areas) {
  const locationSum = areas.reduce(
    ({ lat, lng }, { location }) => ({ lat: lat + location.lat, lng: lng + location.lng }),
    { lat: 0, lng: 0 }
  )
  return {
    lat: locationSum.lat / areas.length,
    lng: locationSum.lng / areas.length
  }
}

function buildTitle(name, numberOfDays) {
  const days = numberOfDays === 1 ? '1 day' : `${numberOfDays} days`
  return `${name} (${days})`
}
