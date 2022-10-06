import React from 'react'
import { Grid, Row, Col } from 'react-bootstrap'
import WordCloud from 'react-d3-cloud'

import { LoadFromServer } from '../LoadFromServer/LoadFromServer'
import { onMobile, onTablet, onSmallDesktop } from '../../screenSize'

const StaticCloudConfig = {
  rotate: () => Math.random() * 90 - 45
}

export const FoodCloud = ({ occurrences, fontScales }) => (
  <WordCloud
    data={occurrences}
    fontSizeMapper={word => selectFontScale(fontScales || {}) * word.value}
    {...StaticCloudConfig}
    {...selectSizes()}
  />
)

export const ConnectedFoodCloud = LoadFromServer({
  component: FoodCloud,
  query: `
    query {
      foodOccurrences {
        name
        count
      }
    }
  `,
  dataToProps: ({ foodOccurrences }) => ({
    occurrences: parseFoodOccurrences(foodOccurrences)
  })
})

export function parseFoodOccurrences(foodOccurrences) {
  if (!foodOccurrences) {
      return []
  }
  return foodOccurrences.map(({ name, count }) => ({
    text: name,
    value: count
  }))
}

function selectFontScale({ xs, sm, md, lg }) {
  if (onMobile())
    return xs || 1
  else if (onTablet())
    return sm || 2.5
  else if (onSmallDesktop())
    return md || 3
  else
    return lg || 4
}

function selectSizes() {
  if (onMobile())
    return { height: 600, width: 300 }
  else if (onTablet())
    return { height: 600, width: 700 }
  else if (onSmallDesktop())
    return { height: 600, width: 900 }
  else
    return { height: 600, width: 1000 }
}

