import React from 'react'
import { shallow } from 'enzyme'

import { DayLink } from './DayLink'

describe('DayLink', () => {
  it('should render', () => {
    const day = { number: 1, locations: { edges: [{ node: { area: { name: 'A' } } }] } }
    expect(() => shallow(<DayLink day={day} />)).not.toThrow()
  })
})
