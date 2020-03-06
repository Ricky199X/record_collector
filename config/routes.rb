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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  # routes for session controller actions
  post '/login', to: 'sessions#create'
  get '/auth-check', to: 'sessions#auth_check'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'


  
end
