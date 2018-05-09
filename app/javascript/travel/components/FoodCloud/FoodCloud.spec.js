import React from 'react'
import { shallow } from 'enzyme'

import { FoodCloud } from './FoodCloud'

describe('FoodCloud', () => {
  it('should render', () => {
    global.matchMedia = () => true
    expect(() => shallow(<FoodCloud />)).not.toThrow()
  })
})
