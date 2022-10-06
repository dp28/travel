import React from 'react'
import { shallow } from 'enzyme'

import { Gallery } from './Gallery'

describe('Gallery', () => {
  it('should render', () => {
    expect(() => shallow(<Gallery photos={[]}/>)).not.toThrow()
  })
})
