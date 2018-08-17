Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    root 'articles#index'
    resources :articles, :comments
  end

  resources :articles do
    resources :comments
  end
end
