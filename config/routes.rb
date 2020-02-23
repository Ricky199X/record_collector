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

  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  # sets routes for login, logout + signup
  devise_for :users,
      path: '',
      path_names: {
        sign_in: 'login',
        sign_out: 'logout'
        # registration: 'signup'
      },
      controllers: {
        sessions: 'sessions',
        registrations: 'registrations'
      }
  
end
