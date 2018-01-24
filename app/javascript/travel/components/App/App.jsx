import React from 'react'

import { ConnectedReleases } from '../Releases/Releases'

export const App = () => (
  <div>
    <div>Check out the <a href="/graphiql">API</a></div>
    <ConnectedReleases />
  </div>
)
