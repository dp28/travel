import React from 'react'
import { shallow } from 'enzyme'

import { Day } from './Day'

describe('Day', () => {
  it('should render', () => {
    const day = { number: 1, post: {}, photos: [], countryNames: [] }
    expect(() => shallow(<Day day={day} />)).not.toThrow()
  })
})
