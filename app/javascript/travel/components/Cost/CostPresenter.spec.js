import React from 'react'
import { shallow } from 'enzyme'

import { presentAllDayCosts, presentSingleDayCosts } from './CostPresenter'


function mockDay(overrides = {}) {
  return {
    number: overrides.number || 1,
    totalExpense: {
      ...mockPrice(overrides.price || 60),
      food: mockPrice(overrides.food || 10),
      accommodation: mockPrice(overrides.accommodation || 10),
      activities: mockPrice(overrides.activities || 10),
      shortTravel: mockPrice(overrides.shortTravel || 10),
      longTravel: mockPrice(overrides.longTravel || 10),
      other: mockPrice(overrides.other || 10),
    }
  }
}

function mockPrice(amount) {
  return { price: { dollars: { amount } } }
}

function mockDayEdge(overrides) {
  return { node: mockDay(overrides) }
}

describe('presentAllDayCosts', () => {
  describe('with null input days', () => {
    it('should return an empty array for days', () => {
      expect(presentAllDayCosts({ days: null }).days).toEqual([])
    })

    it('should return a null axis', () => {
      expect(presentAllDayCosts({ days: null }).axis).toEqual(null)
    })
  })

  function mockResponse(...mockDays) {
    return {
      days: {
        edges: mockDays
      }
    }
  }

  describe('with two returned days', () => {
    const mockQueryResponse = mockResponse(
      mockDayEdge({ number: 1 }),
      mockDayEdge({ number: 2, price: 100, food: 50 })
    )

    const result = presentAllDayCosts(mockQueryResponse)

    it('should have one day object for each input day', () => {
      expect(result.days.length).toEqual(2)
    })

    it('should include the number for each day', () => {
      expect(result.days.map(day => day.number)).toEqual([1, 2])
    })

    it('should assign the amount in dollars and width in percent to each expense category for a day', () => {
      expect(result.days[1].costs).toEqual({
        total: { dollars: 100, widthInPercent: 100 },
        food: { dollars: 50, widthInPercent: 50 },
        accommodation: { dollars: 10, widthInPercent: 10 },
        activities: { dollars: 10, widthInPercent: 10 },
        shortTravel: { dollars: 10, widthInPercent: 10 },
        longTravel: { dollars: 10, widthInPercent: 10 },
        other: { dollars: 10, widthInPercent: 10 }
      })
    })
  })

  describe('the axis', () => {
    function buildResponseWithMaxCost(maxCost) {
      return mockResponse(
        mockDayEdge({ number: 1, price: maxCost / 2 }),
        mockDayEdge({ number: 2, price: maxCost })
      )
    }

    function itShouldHaveALineMatching({ actualLine, positionInPercent, valueInDollars }) {
      it(`should have a positionInPercent of ${positionInPercent}`, () => {
        expect(to3dp(actualLine.positionInPercent)).toEqual(to3dp(positionInPercent))
      })

      it(`should have a valueInDollars of ${valueInDollars}`, () => {
        expect(to3dp(actualLine.valueInDollars)).toEqual(to3dp(valueInDollars))
      })
    }

    function to3dp(value) {
      return Math.round(value * 1000) / 1000
    }

    describe('if the maximum cost is 2.5', () => {
      const result = presentAllDayCosts(buildResponseWithMaxCost(2.5))

      it('should have three lines', () => {
        expect(result.axis.lines.length).toEqual(3)
      })

      itShouldHaveALineMatching({
        positionInPercent: 0,
        valueInDollars: 0,
        actualLine: result.axis.lines[0]
      })

      itShouldHaveALineMatching({
        positionInPercent: 40,
        valueInDollars: 1,
        actualLine: result.axis.lines[1]
      })

      itShouldHaveALineMatching({
        positionInPercent: 80,
        valueInDollars: 2,
        actualLine: result.axis.lines[2]
      })
    })

    function itHasCorrectSpacingForMaxCost({ maxCost, spacingInDollars, numberOfLines }) {
      describe(`if the maximum cost is ${maxCost}`, () => {
        const result = presentAllDayCosts(buildResponseWithMaxCost(maxCost))
        const spacingInPercent =  (spacingInDollars / maxCost) * 100

        it(`should have ${numberOfLines} lines`, () => {
          expect(result.axis.lines.length).toEqual(numberOfLines)
        })

        for (let lineNumber = 0; lineNumber < numberOfLines; lineNumber++) {
          describe(`line number ${lineNumber}`, () => {
            itShouldHaveALineMatching({
              positionInPercent: spacingInPercent * lineNumber,
              valueInDollars: spacingInDollars * lineNumber,
              actualLine: result.axis.lines[lineNumber]
            })
          })
        }
      })
    }

    itHasCorrectSpacingForMaxCost({
      maxCost: 4,
      spacingInDollars: 1,
      numberOfLines: 5
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 5,
      spacingInDollars: 2,
      numberOfLines: 3
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 8.5,
      spacingInDollars: 2,
      numberOfLines: 5
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 9,
      spacingInDollars: 5,
      numberOfLines: 2
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 20.1,
      spacingInDollars: 5,
      numberOfLines: 5
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 21.1,
      spacingInDollars: 10,
      numberOfLines: 3
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 40.9,
      spacingInDollars: 10,
      numberOfLines: 5
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 41,
      spacingInDollars: 25,
      numberOfLines: 2
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 100.9,
      spacingInDollars: 25,
      numberOfLines: 5
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 101,
      spacingInDollars: 50,
      numberOfLines: 3
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 200.9,
      spacingInDollars: 50,
      numberOfLines: 5
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 201,
      spacingInDollars: 100,
      numberOfLines: 3
    })

    itHasCorrectSpacingForMaxCost({
      maxCost: 401,
      spacingInDollars: 250,
      numberOfLines: 2
    })
  })
})


describe('presentSingleDayCosts', () => {
  it('should assign the amount in dollars and width in percent to each expense category for a day', () => {
    const result = presentSingleDayCosts(mockDay())
    expect(result).toEqual({
      total: { dollars: 60, widthInPercent: 600 },
      food: { dollars: 10, widthInPercent: 100 },
      accommodation: { dollars: 10, widthInPercent: 100 },
      activities: { dollars: 10, widthInPercent: 100 },
      shortTravel: { dollars: 10, widthInPercent: 100 },
      longTravel: { dollars: 10, widthInPercent: 100 },
      other: { dollars: 10, widthInPercent: 100 }
    })
  })

  it('should scale the width in percentages to be relative to the largest individual cost, apart from the total', () => {
    const result = presentSingleDayCosts(mockDay({ food: 50, price: 100 }))
    expect(result).toEqual({
      total: { dollars: 100, widthInPercent: 200 },
      food: { dollars: 50, widthInPercent: 100 },
      accommodation: { dollars: 10, widthInPercent: 20 },
      activities: { dollars: 10, widthInPercent: 20 },
      shortTravel: { dollars: 10, widthInPercent: 20 },
      longTravel: { dollars: 10, widthInPercent: 20 },
      other: { dollars: 10, widthInPercent: 20 }
    })
  })
})
