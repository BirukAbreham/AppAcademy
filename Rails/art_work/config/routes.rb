Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # route for the users resource
  resources :users, only: [:index, :show, :create, :update, :destroy]

  # nest collection route
  resources :users do
    resources :artworks, only: [:index]
  end

  # route for the artworks resource
  resources :artworks, only: [:show, :create, :update, :destroy]

  # routes for the artwork_shares resource
  resources :artwork_shares, only: [:create, :destroy]
end
