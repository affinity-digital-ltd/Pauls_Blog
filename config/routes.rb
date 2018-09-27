Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/portfolio'
  root 'articles#index'

  namespace :admin do
    root 'articles#index'
    resources :articles, except: [:show]
  end

  resources :articles, only: [:index, :show] do
    resources :comments
  end
end
