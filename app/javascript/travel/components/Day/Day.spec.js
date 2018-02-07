import React from 'react'
import { shallow } from 'enzyme'

import { Days } from './Days'

describe('Days', () => {
  it('should render', () => {
    const day = { number: 1, post: {} }
    expect(() => shallow(<Day day={day} />)).not.toThrow()
  })
})
