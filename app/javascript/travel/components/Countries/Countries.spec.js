import React from 'react'
import { shallow } from 'enzyme'

import { Countries } from './Countries'

describe('Countries', () => {
  it('should render', () => {
    expect(() => shallow(<Countries countries={[]} />)).not.toThrow()
  })
})
