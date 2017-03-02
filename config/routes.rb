Rails.application.routes.draw do

  resources :registerdapps do
  	resources :events
  end

  root 'welcome#index'
  get 'welcome/about'

  devise_for :users

  namespace :api, defaults: {format: :json} do
  	match '/events', to: 'events#preflight', via: [:options]
  	resources :events, only: [:create]
  end
end
