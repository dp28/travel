import React from 'react'

export const Releases = ({ releases }) => (
  <table className="Releases">
    <tr>
      <th>Version</th>
    </tr>
    {releases.map(release => (
      <li>
        <tr>
          <td>{release.version}</td>
        </tr>
      </li>
    ))}
  </table>
)
