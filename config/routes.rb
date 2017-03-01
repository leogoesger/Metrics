Rails.application.routes.draw do

  resources :registerdapps do
  	resources :events, except: [:index]
  end

  root 'welcome#index'
  get 'welcome/about'

  devise_for :users
end
