import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import './styles.sass'

const Hello = () => (
  <div>Check out the <a href="/graphiql">API</a></div>
)

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello />,
    document.body.appendChild(document.createElement('div')),
  )
})
