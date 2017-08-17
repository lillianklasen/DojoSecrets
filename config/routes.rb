Rails.application.routes.draw do
  post 'secrets' => 'secrets#create'
  delete 'destroy/:id' => 'secrets#destroy'
  get 'secrets' => 'secrets#index'

  post 'secrets/like' => 'likes#create'
  delete 'secrets/unlike/:id' => 'likes#destroy'

  post 'login' => 'sessions#create'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  root 'users#index'
  get 'users/:id' => 'users#show'
  get 'register' => 'users#new'
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'


end
