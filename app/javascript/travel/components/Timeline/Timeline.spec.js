import React from 'react'
import { shallow } from 'enzyme'

import { Timeline } from './Timeline'

describe('Timeline', () => {
  it('should render', () => {
    expect(() => shallow(<Timeline days={[]} />)).not.toThrow()
  })
})
