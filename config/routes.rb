Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :edit]
  resources :userfavorites, only: [:index]
  resources :search, only: [:index]
  patch '/users/:id', to: 'users#update', as: :update_user
end
