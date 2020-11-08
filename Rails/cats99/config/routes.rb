Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # cats routes
  resources :cats

  # cat_rental_requests
  resources :cat_rental_requests, only: [ :new, :create]

  # cat_rental_requests member routes
  resources :cat_rental_requests do
    member do
      get 'approve'
      get 'deny'
    end  
  end

end
