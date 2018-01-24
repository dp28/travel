import React from 'react'
import { graphql } from 'react-apollo';
import gql from 'graphql-tag';

export const Releases = ({ releases, loading }) => {
  if (loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return (
      <table className="Releases">
        <tbody>
          <tr>
            <th>Version</th>
          </tr>
          {releases.map(release => (
            <tr key={release.version}>
              <td>{release.version}</td>
            </tr>
          ))}
        </tbody>
      </table>
    )
  }
}

export const ConnectedReleases = graphql(gql`
  query {
    releases {
      edges {
        node {
          version
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

