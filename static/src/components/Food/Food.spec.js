import React from 'react'
import { shallow } from 'enzyme'

import { Food } from './Food'

describe('Food', () => {
  it('should render', () => {
    expect(() => shallow(<Food />)).not.toThrow()
  })
})
