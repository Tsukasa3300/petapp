Rails.application.routes.draw do
  get "/login", to: 'sessions#new'
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  
  root  "static_pages#home"
  get "static_pages/home"

  get "/posts", to: "posts#index"
  get 'posts/show'

  get "/users", to:'users#index'
  get "/signup", to:'users#new'

 resources :users
 resources :pets do
  resources :statuses
 end
 
end
