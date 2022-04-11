Rails.application.routes.draw do

  root 'dashboard#index'
  resources :users
  resources :patients 
  resources :doctors
  resources :prescription
  resources :appointments do 
    put 'status_update' 
  end
  resources :session do 
    delete 'logout' => :destroy 
  end
  resources :rooms do 
    resources :messages  
  end

end
