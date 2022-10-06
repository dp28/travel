import React from 'react'
import { shallow } from 'enzyme'

import { Cost } from './Cost'

describe('Cost', () => {
  it('should render', () => {
    expect(() => shallow(<Cost days={[]} axis={{ lines: [] }}/>)).not.toThrow()
  })
})
