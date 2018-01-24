import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import { ApolloProvider } from 'react-apollo'

import { App } from './components/App/App'
import { Client } from './apolloClient'
import './styles.sass'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ApolloProvider client={Client}>
      <App />
    </ApolloProvider>,
    document.body.appendChild(document.createElement('div')),
  )
})
