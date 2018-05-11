import React from 'react'
import { Navbar, Nav, NavItem, NavDropdown, MenuItem } from 'react-bootstrap'
import { IndexLinkContainer } from 'react-router-bootstrap'
import { Link } from 'react-router-dom'

import './Navigation.sass'

const Links = {
  about: 'About',
  countries: 'Countries',
  gallery: 'Gallery',
  videos: 'Videos',
  food: 'Food'
}

export const Navigation = () => (
  <Navbar inverse collapseOnSelect>
  <Navbar.Header>
    <Navbar.Brand>
      <Link to="/">
        R
        <span style={{fontFamily: 'cursive'}}>&nbsp;&amp;&nbsp;</span>
        D Travels
      </Link>
    </Navbar.Brand>
    <Navbar.Toggle />
  </Navbar.Header>
  <Navbar.Collapse>
    <Nav pullRight>
      {
        Object.entries(Links).map(([route, name], index) => (
          <IndexLinkContainer to={`/${route}`} key={name}>
            <NavItem eventKey={index + 1}>
              {name}
            </NavItem>
          </IndexLinkContainer>
        ))
      }
      <NavItem eventKey={Object.entries(Links).length} href="/history">
        History
      </NavItem>
    </Nav>
  </Navbar.Collapse>
</Navbar>
)
