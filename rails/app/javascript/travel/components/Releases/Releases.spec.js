import React from 'react'
import { shallow } from 'enzyme'

import { Releases } from './Releases'

describe('Releases', () => {
  it('should render', () => {
    const release = { version: '12345' }
    expect(() => shallow(<Releases releases={[release]} />)).not.toThrow()
  })
})
