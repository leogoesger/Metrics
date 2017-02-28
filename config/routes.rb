Rails.application.routes.draw do
  resources :registerdapps

  root 'welcome#index'
  get 'welcome/about'

  devise_for :users
end
