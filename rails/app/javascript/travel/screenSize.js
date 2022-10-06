const SMALL_SCREEN_WIDTH = 768
const MEDIUM_SCREEN_WIDTH = 992
const LARGE_SCREEN_WIDTH = 1200

function screenLargerThan(size) {
  return window.matchMedia(`(min-width: ${size}px)`).matches
}


export function onMobile() {
  return !screenLargerThan(SMALL_SCREEN_WIDTH)
}

export function onTablet() {
  return screenLargerThan(SMALL_SCREEN_WIDTH) && !screenLargerThan(MEDIUM_SCREEN_WIDTH)
}

export function onSmallDesktop() {
  return screenLargerThan(MEDIUM_SCREEN_WIDTH)  && !screenLargerThan(LARGE_SCREEN_WIDTH)
}
















