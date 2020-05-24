Rails.application.routes.draw do
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  resources :tasks, only: [:create, :new, :edit, :show, :update, :destroy]
  
  get "signup", to: "users#new"
  resources :users, only: [:create]
  
  
end
