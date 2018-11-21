Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
  root 'articles#index'
  get 'static_pages/about'
  get 'static_pages/portfolio'
  get 'static_pages/contact'
  
  namespace :admin do
    root 'articles#index'
    resources :articles, except: [:show]
  end

  resources :articles, only: [:index, :show] do
    resources :comments
  end
  resources :messages, only: :create

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'auth0#logout'
end
