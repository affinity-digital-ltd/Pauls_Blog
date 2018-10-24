Rails.application.routes.draw do
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
end
