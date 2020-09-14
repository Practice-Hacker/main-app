Rails.application.routes.draw do
  get 'user_favorites/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :edit]
  # get "/users/:id", to: "users#show"
  # get "/users/:id/edit", to: "users#edit"
  patch "/users/:id", to: "users#update", as: :update_user

  resources :user_favorites, only: [:index]
end
