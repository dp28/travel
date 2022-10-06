import React from 'react'
import { shallow } from 'enzyme'

import { Country } from './Country'

describe('Country', () => {
  it('should render', () => {
    const country = {
      name: 'Peru',
      foodOccurrences: [],
      days: [],
      photos: [],
      averageCosts: { total: { dollars: 0 } }
    }
    expect(() => shallow(<Country country={country} />)).not.toThrow()
  })
})
