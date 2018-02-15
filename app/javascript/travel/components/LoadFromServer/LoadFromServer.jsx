import React from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'

const LoadingOrComponent = Component => props => {
  if (props.loading) {
    return <div className="loading">Loading ...</div>
  }
  else {
    return <Component {...props} />
  }
}

export const LoadFromServer = ({ query, dataToProps, propsToVariables, component }) => {
  return graphql(
    gql(query),
    buildGraphqlConfig(dataToProps, propsToVariables)
  )(LoadingOrComponent(component))
}

function buildGraphqlConfig(dataToProps, propsToVariables) {
  const graphqlConfig = { props: extractPropsFromQueryResult(dataToProps) }
  if (propsToVariables) {
    graphqlConfig.options = props => ({ variables: propsToVariables(props) })
  }
  return graphqlConfig
}

function extractPropsFromQueryResult(dataToProps) {
  return ({ data }) => ({ loading: data.loading, ...dataToProps(data) })
}
