import React from 'react'
import { shallow } from 'enzyme'

import { Navigation } from './Navigation'

describe('Navigation', () => {
  it('should render', () => {
    expect(() => shallow(<Navigation />)).not.toThrow()
  })
})
