import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { QueryParamLink, getQueryParamValue } from '../Links/Links'
import { presentAllDayCosts } from './CostPresenter'
import { AllDayCosts } from './CostQueries'
import { ConnectedCostBreakdown } from './CostBreakdown'
import './Cost.sass'

export const FOCUS_DAY_PARAM = 'focusDay'

export const Cost = ({ days, axis }) => {
  const focusedDay = getQueryParamValue(FOCUS_DAY_PARAM)
  const focusedDayNumber = Number(focusedDay)
  return (
    <Grid>
      <Row>
        <Col xs={12}>
          <div className="costChart">
            <div className="axis--labels">
              {
                axis.lines.map(line => (
                  <div
                    className="axis--label"
                    key={line.valueInDollars}
                    style={{ left: `${line.positionInPercent}%` }}
                  >
                    ${line.valueInDollars}
                  </div>
                ))
              }
            </div>
            <div className="axis">
              {
                axis.lines.map(line => (
                  <div
                    key={line.valueInDollars}
                    className="axis--line"
                    style={{ left: `${line.positionInPercent}%` }}
                  />
                ))
              }
            </div>
            <div className="costChart--bars">
              {
                days.map(day => (
                  <div
                    className={`day ${day.number == focusedDayNumber ? 'focused' : ''}`}
                    key={day.number}
                  >
                    <QueryParamLink param={FOCUS_DAY_PARAM} value={day.number}>
                      {
                        Object.entries(day.costs).map(([category, cost]) => (
                          <span
                            className={`cost ${category}`}
                            key={category}
                            style={{ width: `${cost.widthInPercent}%` }}
                          />
                        ))
                      }
                    </QueryParamLink>
                  </div>
                ))
              }
              </div>
          </div>
          {focusedDay && <ConnectedCostBreakdown dayNumber={focusedDayNumber} />}
        </Col>
      </Row>
    </Grid>
  )
}

export const ConnectedCost = LoadFromServer({
  component: Cost,
  query: AllDayCosts,
  dataToProps: presentAllDayCosts
})
