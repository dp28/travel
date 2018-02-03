import React from 'react'
import { Navbar, Nav, NavItem, NavDropdown, MenuItem } from 'react-bootstrap'
import { IndexLinkContainer } from 'react-router-bootstrap'
import { Link } from 'react-router-dom'

export const Navigation = () => (
  <Navbar inverse collapseOnSelect>
  <Navbar.Header>
    <Navbar.Brand>
      <Link to="/">Travel Diary</Link>
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
    </Nav>
  </Navbar.Collapse>
</Navbar>
)
