Rails.application.routes.draw do

  root 'dashboard#index'
  resources :appointments do put 'status_update' end
  resources :session
  resources :patients 
  resources :users
  resources :doctors

end
