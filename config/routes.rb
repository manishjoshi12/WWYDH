Rails.application.routes.draw do

  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  get '/register' => 'static_pages#register'
  get '/login' => 'static_pages#login'
  get '/profile' => 'static_pages#profile'
  get '/editprofile' => 'static_pages#editprofile'

  root 'static_pages#home'

end
