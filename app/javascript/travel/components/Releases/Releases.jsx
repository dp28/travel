import React from 'react'
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

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

export const ConnectedReleases = graphql(gql`
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
`, {
  props: ({ data: { releases, loading } }) => ({
    loading,
    releases: loading ? [] : releases.edges.map(edge => edge.node)
  })
})(Releases)

