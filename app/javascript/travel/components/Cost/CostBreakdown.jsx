import React from 'react'

import { DayLink } from '../DayLink/DayLink'
import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { presentGroupedCosts } from './CostPresenter'
import { SingleDayCosts } from './CostQueries'
import './Cost.sass'

export const CostBreakdownTable = ({ costs }) => (
  <table className="categoryBreakdown">
    <tbody>
      {
        Object.entries(costs).map(([category, cost]) => (
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
)

export const CostBreakdown = ({ day }) => (
  <div className="costChart costBreakdown">
    <div className="costChart--bars">
      <div className="day">
        <DayLink day={day}>Day {day.number}</DayLink>
        <CostBreakdownTable costs={day.costs} />
      </div>
    </div>
  </div>
)

export const ConnectedCostBreakdown = LoadFromServer({
  component: CostBreakdown,
  query: SingleDayCosts,
  propsToVariables: ({ dayNumber }) => ({ dayNumber }),
  dataToProps: ({ day }) => {
    if (!day)
      return null
    return {
      day: {
        ...day,
        costs: presentGroupedCosts(day.totalExpense)
      }
    }

  }
})

