import React from 'react'

import { DayLink } from '../DayLink/DayLink'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { presentSingleDayCosts } from './CostPresenter'
import { SingleDayCosts } from './CostQueries'
import './Cost.sass'

export const CostBreakdown = ({ day }) => (
  <div className="costChart costBreakdown">
    <div className="costChart--bars">
      <div className="day">
        <table className="categoryBreakdown">
          <tbody>
            <tr>
              <td />
              <td>
                <DayLink day={day}>Day {day.number}</DayLink>
              </td>
            </tr>
            {
              Object.entries(day.costs).map(([category, cost]) => (
                <tr key={category} className={`costRow ${category}`}>
                  <td className="categoryColumn">{category}</td>
                  <td className="costColumn">
                    <div
                      className={`cost ${category}`}
                      style={{ width: `${cost.widthInPercent}%` }}
                    >
                      ${cost.dollars}
                    </div>
                  </td>
                </tr>
              ))
            }
          </tbody>
        </table>
      </div>
    </div>
  </div>
)

export const ConnectedCostBreakdown = LoadFromServer({
  component: CostBreakdown,
  query: SingleDayCosts,
  dataToProps: ({ day }) => ({ day: day ? presentSingleDayCosts(day) : null }),
  propsToVariables: ({ dayNumber }) => ({ dayNumber })
})

