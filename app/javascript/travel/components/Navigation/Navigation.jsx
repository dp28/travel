import React from 'react'
import { Navbar, Nav, NavItem, NavDropdown, MenuItem } from 'react-bootstrap'
import { IndexLinkContainer } from 'react-router-bootstrap'
import { Link } from 'react-router-dom'

import './Navigation.sass'

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
      <IndexLinkContainer to="/">
        <NavItem eventKey={1}>
          Diary
        </NavItem>
      </IndexLinkContainer>
      <IndexLinkContainer to="/about">
        <NavItem eventKey={2}>
          About
        </NavItem>
      </IndexLinkContainer>
      <IndexLinkContainer to="/gallery">
        <NavItem eventKey={3}>
          Gallery
        </NavItem>
      </IndexLinkContainer>
      <IndexLinkContainer to="/videos">
        <NavItem eventKey={3}>
          Videos
        </NavItem>
      </IndexLinkContainer>
    </Nav>
  </Navbar.Collapse>
</Navbar>
)
