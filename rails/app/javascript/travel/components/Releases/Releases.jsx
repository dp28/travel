import React from 'react'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { edgesToArray } from '../../mapGraphqlResults'

export const Releases = ({ releases, loading }) => {
  if (loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return (
      <div>
        See what the site looked like at:
        <ul>
          {releases.map(release => (
            <li key={release.version}>
              <a href={'/versions/' + release.version}>
                {new Date(release.time).toString().substring(0, 21)}
              </a>
            </li>
          ))}
        </ul>
      </div>
    )
  }
}

export const ConnectedReleases = LoadFromServer({
  component: Releases,
  query: `
  query {
    releases {
      edges {
        node {
          version
          time
        }
      }
    }
  }
`,
  dataToProps: ({ releases }) => ({
    releases: edgesToArray(releases)
  })
})

