import React from 'react'
import { shallow } from 'enzyme'

import { CostBreakdown } from './CostBreakdown'

describe('CostBreakdown', () => {
  it('should render', () => {
    const day = { number: 1, post: {}, photos: [], costs: [] }
    expect(() => shallow(<CostBreakdown day={day} />)).not.toThrow()
  })
})
