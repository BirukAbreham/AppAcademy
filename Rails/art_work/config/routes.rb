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

  # nested collection route, user -> comments
  resources :users do
    resources :comments, only: [:index]
  end

  # nested collection route, artwork -> comments
  get 'artworks/:artwork_id/comments', to: 'comments#index'

  # routes for the comments resource
  resources :comments, only: [:create, :destroy]
  
end
