Rails.application.routes.draw do

  root 'dashboard#index'
  resources :session
  resources :patients 
  resources :users
  resources :doctors

end
