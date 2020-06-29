Rails.application.routes.draw do


  
  root to: 'pages#home'
  devise_for :users

  resources :dayoffs
  resources :users_staff, :controller => 'users'
  resources :day_off_requests do 
    member do 
      post :approve
      post :denied
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
