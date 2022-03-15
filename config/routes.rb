Rails.application.routes.draw do
# get 'users/index'
resources :paitens
resources :users
resources :doctors

end
