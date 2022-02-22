Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies
  resources :purchases, except: [:delete, :edit]
  patch '/purchases/:id', to: 'purchases#mark_as_received'
  patch '/purchases/:id', to: 'purchases#accept_request'
  patch '/purchases/:id', to: 'purchases#decline_request'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
