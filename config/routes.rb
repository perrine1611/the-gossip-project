Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'static_pages/team'
  get 'static_pages/contact'
  get 'welcome/index'
  get 'users/show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/team', to: 'team'
  get 'static_pages/team', to: 'static_pages#team'
  get 'static_pages/contact', to: 'static_pages#contact'

  get '/welcome/:first_name', to: 'welcome#index'
  get '/users/:id', to: 'users#show'
end
