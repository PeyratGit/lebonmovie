Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :movies do
    resources :purchases, only: [:create]
    collection do
      get :action
      get :thriller
      get :horror
      get :comedy
      get :animation
      get :crime
      get :fantasy
    end
  end
  get '/my/movies', to: 'movies#my_movies'
  resources :purchases, except: [:delete, :new, :create] do
    member do
      patch '/rate', to: "purchases#rate"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
