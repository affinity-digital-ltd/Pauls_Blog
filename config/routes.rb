Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
  resources :articles

  namespace :admin do
    resources :articles, :comments
  end
end
