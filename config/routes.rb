Rails.application.routes.draw do

  root 'dashboard#index'
  resources :appointments do put 'status_update' end
  resources :session do delete 'logout' => :destroy end
  resources :patients 
  resources :users
  resources :doctors
  resources :prescription
  resources :rooms do 
    resources :messages  
  end

end
