import React from 'react'

import { ConnectedReleases } from '../Releases/Releases'
import { ConnectedDays } from '../Days/Days'

export const App = () => (
  <div>
    <div>Check out the <a href="/graphiql">API</a></div>
    <ConnectedReleases />
    <ConnectedDays />
  </div>
)
