Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
  namespace :admin do
    root 'articles#index'
    resources :articles, except: [:show]
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
