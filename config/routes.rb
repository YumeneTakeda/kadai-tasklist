Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  
  get "signup", to: "users#new"
  resources :users, only: [:create]
  
  root to: "tasks#index"
end
