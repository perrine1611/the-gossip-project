Rails.application.routes.draw do
  
  root 'welcome#index'

  resources :comments

  resources :gossip

  resources :gossip do 
  resources :comments
  end

  resources :cities
  
  resources :team
  
  resources :user
  
  resources :contact
  
  resources :welcome

  resources :sessions, only: [:new, :create, :destroy]
  
  get 'welcome/index'
  get 'users/show'

  get '/welcome/:first_name', to: 'welcome#index'
  get '/users/:id', to: 'users#show'
  
end
