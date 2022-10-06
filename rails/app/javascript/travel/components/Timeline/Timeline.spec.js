import React from 'react'
import { shallow } from 'enzyme'

import { Timeline } from './Timeline'

describe('Timeline', () => {
  it('should render', () => {
    global.matchMedia = () => true
    expect(() => shallow(<Timeline days={[]} />)).not.toThrow()
  })
})
