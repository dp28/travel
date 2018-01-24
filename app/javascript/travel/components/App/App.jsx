import React from 'react'

import { ConnectedReleases } from '../Releases/Releases'
import { ConnectedDays } from '../Days/Days'
import { About } from '../About/About'

export const App = () => (
  <div>
    <About />
    <ConnectedReleases />
    <ConnectedDays />
  </div>
)
