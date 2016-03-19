Rails.application.routes.draw do



  

  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  
  
  get '/profile' => 'static_pages#profile'
  get '/editprofile' => 'static_pages#editprofile'

  root 'static_pages#home'
  resources :vacants
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
  get "/register" => "users#new", as: "register"
end
