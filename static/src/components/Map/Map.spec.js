import React from 'react'
import { shallow } from 'enzyme'

import { Map } from './Map'

describe('Map', () => {
  it('should render', () => {
    expect(() => shallow(<Map areas={[]} />)).not.toThrow()
  })
})
