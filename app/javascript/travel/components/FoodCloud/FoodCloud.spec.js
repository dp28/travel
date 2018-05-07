import React from 'react'
import { shallow } from 'enzyme'

import { FoodCloud } from './FoodCloud'

describe('FoodCloud', () => {
  it('should render', () => {
    expect(() => shallow(<FoodCloud />)).not.toThrow()
  })
})
