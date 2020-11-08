Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # cats routes
  resources :cats

  # cat_rental_requests
  resources :cat_rental_requests, only: [ :new, :create]

end
