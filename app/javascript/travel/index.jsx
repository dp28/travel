import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import { App } from './components/App/App'
import './styles.sass'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})
