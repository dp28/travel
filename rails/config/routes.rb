Rails.application.routes.draw do
  root controller: 'apps', action: 'current'
  get '/history', controller: 'apps', action: 'history'
  get '/versions/:version', controller: 'apps', action: 'version'
  post '/graphql', controller: 'graphql', action: 'resolve'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  get '*path', controller: 'apps', action: 'current'
end
