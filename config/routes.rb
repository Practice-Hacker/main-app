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
<<<<<<< HEAD
  patch '/users/:id', to: 'users#update', as: :update_user
  resources :pieces, only: [:show], as: :piece_show
=======
>>>>>>> e4d7ddd1aac99301e192574b00d273ef57b128dc
end
