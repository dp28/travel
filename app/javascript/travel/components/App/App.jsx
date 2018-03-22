import React from 'react'
import { Grid } from 'react-bootstrap'
import { BrowserRouter as Router, Route } from 'react-router-dom'

import { ConnectedDay } from '../Day/Day'
import { ConnectedGallery } from '../Gallery/Gallery'
import { Videos } from '../Videos/Videos'
import { About } from '../About/About'
import { ConnectedHome } from '../Home/Home'
import { Navigation } from '../Navigation/Navigation'

const InGrid = page => props => (
  <Grid>{page(props)}</Grid>
)

export const App = () => (
  <Router>
    <div>
      <Navigation />
      <Route exact path="/" component={ConnectedHome}/>
      <Route path="/about" component={InGrid(About)}/>
      <Route path="/gallery" component={ConnectedGallery}/>
      <Route path="/videos" component={Videos}/>
      <Route path="/days/:number" component={ConnectedDay}/>
    </div>
  </Router>
)
