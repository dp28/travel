Rails.application.routes.draw do
  root controller: 'apps', action: 'current'
  post '/graphql', controller: 'graphql', action: 'resolve'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
