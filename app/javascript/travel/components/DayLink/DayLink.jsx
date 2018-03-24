import React from 'react'
import { Link } from 'react-router-dom'

import { SELECTED_AREA_PARAM } from '../Map/Map'


export const LinkableDayFragment = `
  fragment LinkableDay on Day {
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
`

export const DayLink = ({ day, children }) => {
  const area = encodeURIComponent(day.locations.edges[0].node.area.name)
  return <Link to={`/days/${day.number}?${SELECTED_AREA_PARAM}=${area}`}>{children}</Link>
}

