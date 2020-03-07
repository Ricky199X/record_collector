Rails.application.routes.draw do
  # resources :user_albums

  resources :albums do 
    resources :songs
  end

  resources :artists do 
    resources :albums
  end

  resources :users do 
    resources :albums, only: [:index, :show]
  end

  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  # routes for session controller actions
  get '/' => 'application#home'
  post '/login' => 'sessions#login'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#logout'
  get '/auth-check' => 'sessions#auth_check'

  
end
