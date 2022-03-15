Rails.application.routes.draw do
# get 'users/index'
resources :patients
resources :users
resources :doctors

end
