Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies do
    resources :purchases, only: [:new, :create]
  end
  resources :purchases, except: [:delete, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
