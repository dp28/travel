import React from 'react'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'
import { DayLink, LinkableDayFragment } from '../DayLink/DayLink'
import { QueryParamLink, getQueryParamValue } from '../Links/Links'
import { onMobile, onTablet, onSmallDesktop } from '../../screenSize'
import './Timeline.sass'

const FIRST_NUMBER = 1
const TIMELINE_CENTRE_PARAM = 'timelineCentre'

const ScrollTimeline = ({ centreNumber, disabled, children }) => {
  if (disabled) {
    return (
      <span className="Timeline--scroll Timeline--point">
        <a disabled="true">
          {children}
        </a>
      </span>
    )
  }
  return (
    <span className="Timeline--scroll Timeline--point">
      <QueryParamLink param={TIMELINE_CENTRE_PARAM} value={centreNumber}>
        {children}
      </QueryParamLink>
    </span>
  )
}

export const Timeline = ({ days, selectedDay }) => {
  const centreNumber = Number(getQueryParamValue(TIMELINE_CENTRE_PARAM)) || selectedDay
  const evenSideWidth = getEvenSideWidth()
  const daysToDisplay = findDisplayableTimelinePoints(days, centreNumber, evenSideWidth)
  return (
    <div className="Timeline">
      <ScrollTimeline
        centreNumber={Math.max(FIRST_NUMBER, centreNumber - evenSideWidth)}
        disabled={centreNumber <= evenSideWidth + 1}
      >
      {'<'}
      </ScrollTimeline>
      {
        daysToDisplay.map(day => (
          <span
            key={day.number}
            className={`Timeline--point ${selectedDay === day.number ? 'selected' : ''}`}
          >
            <DayLink day={day}>
              {day.number}
            </DayLink>
          </span>
        ))
      }
      <ScrollTimeline
        centreNumber={Math.min(days.length, centreNumber + evenSideWidth)}
        disabled={days.length - centreNumber <= evenSideWidth}
      >
      {'>'}
      </ScrollTimeline>
    </div>
  )
}

export const ConnectedTimeline = LoadFromServer({
  component: Timeline,
  query: `
    ${LinkableDayFragment}

    query days {
      days {
        edges {
          node {
            date
            ...LinkableDay
          }
        }
      }
    }
  `,
  propsToVariables: ({ match }) => ({}),
  dataToProps: ({ days }) => ({
    days: edgesToArray(days)
  })
})

function findDisplayableTimelinePoints(points, centreNumber, evenSideWidth) {
  const sideWidth = calculateSideWidth(points.length, centreNumber, evenSideWidth)
  return points.filter(point => (
    point.number >= centreNumber - sideWidth && point.number <= centreNumber + sideWidth)
  )
}

function calculateSideWidth(numberOfPoints, centreNumber, evenSideWidth) {
  const smallestDistanceToEdge = Math.min(centreNumber, numberOfPoints - centreNumber)
  if (smallestDistanceToEdge <= evenSideWidth) {
    const unevenSideWidth = evenSideWidth + (evenSideWidth - smallestDistanceToEdge)
    return  centreNumber > numberOfPoints / 2 ? unevenSideWidth : unevenSideWidth + 1
  }
  return evenSideWidth
}

function getEvenSideWidth() {
  if (onMobile())
    return 4
  else if (onTablet())
    return 10
  else if (onSmallDesktop())
    return 14
  else
    return 17
}
