Rails.application.routes.draw do
  root controller: 'apps', action: 'current'
  post '/graphql', controller: 'graphql', action: 'resolve'
end
