import React from 'react'
import { shallow } from 'enzyme'

import { Home } from './Home'

describe('Home', () => {
  it('should render', () => {
    const mockDay = { locations: { edges: [ { node: { area: { name: 'test' } } } ] } }
    expect(() => shallow(<Home firstDay={mockDay} mostRecentDay={mockDay}/>)).not.toThrow()
  })
})
