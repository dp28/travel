import React from 'react'
import { Link } from 'react-router-dom'
import queryString from 'query-string'

export const QueryParamLink = ({ param, value, children }) =>  {
  const currentPath = window.location.pathname
  const query = queryString.parse(window.location.search)
  query[param] = value
  return (
    <Link to={`${currentPath}?${queryString.stringify(query)}`} >
      {children}
    </Link>
  )
}

export const PathLink = ({ path, children }) => (
  <Link to={`${path}${window.location.search}`}>{children}</Link>
)

export function getQueryParamValue(param) {
  return queryString.parse(window.location.search)[param]
}
