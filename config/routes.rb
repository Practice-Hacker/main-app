Rails.application.routes.draw do
  get 'user_favorites/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :edit]
  patch "/users/:id", to: "users#update", as: :update_user

  resources :search, only: [:index]

  resources :user_favorites, only: [:index]

  resources :piece, only: [:show]
  resources :pieces, only: [:show], as: :piece_show

  get '/pieces/:id/tips/new', to: 'tips#new'
  post '/pieces/:id', to: 'tips#create'
  get '/pieces/:id/tips/:tip_id/edit', to: 'tips#edit'
  patch 'pieces/tips/:id', to: 'tips#update'
end
