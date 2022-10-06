const path = require('path')
const environment = require('./environment')

const config = environment.toWebpackConfig()
config.devtool = 'cheap-module-source-map'

const versionTag = process.env.RELEASE_VERSION
if (versionTag) {;
  config.output.filename = `[name].js`
  config.plugins[1].filename = `[name].css`
  config.output.path = path.join(__dirname, '../../public/releases', versionTag)
  config.output.publicPath = `/releases/${versionTag}`
}

module.exports = config
