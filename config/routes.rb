Tasker::Application.routes.draw do
  resources :users
  resources :sessions,      only: [:new, :create, :destroy]
  resources :tasks
  resources :categories
  
  root 'static_pages#home'
  match '/tasks',        to: 'static_pages#home',  via: 'get'
  match '/categories',   to: 'categories#index',  via: 'get'
  match '/signup',	     to: 'users#new',		      via: 'get' 
  match '/signin',	     to: 'sessions#new',		  via: 'get'
  match '/signout',      to: 'sessions#destroy',  via: 'delete'

end
