Rails.application.routes.draw do



  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/register' => 'static_pages#register'
  
  get '/profile' => 'static_pages#profile'
  get '/editprofile' => 'static_pages#editprofile'

  root 'static_pages#home'
  resources :vacants
  resources :sessions, only: [:new, :create, :destroy]

  get "/login" => "sessions#new", as: "login"
  delete "/logout" => "sessions#destroy", as: "logout"
end
