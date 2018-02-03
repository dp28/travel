import React from 'react'
import GoogleMap from 'google-map-react'

import './Map.sass'

const DEFAULT_CENTRE = {
  lat: 15,
  lng: 102
}

export const Map = () => (
  <div className="Map">
    <GoogleMap center={DEFAULT_CENTRE} zoom={5} >
    </GoogleMap>
  </div>
)