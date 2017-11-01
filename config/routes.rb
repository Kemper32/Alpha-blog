Rails.application.routes.draw do
 get 'pages/home', to: 'pages#home'
 get 'pages/about', to: 'pages#about'
 
 root :to => 'pages#home'
 
 resources :articles
 
 get 'signup', to: 'users#new'
 resources :users, except: [:new]
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 
end