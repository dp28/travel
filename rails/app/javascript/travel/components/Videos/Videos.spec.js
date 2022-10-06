import React from 'react'
import { shallow } from 'enzyme'

import { Videos } from './Videos'

describe('Videos', () => {
  it('should render', () => {
    expect(() => shallow(<Videos />)).not.toThrow()
  })
})
