Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get 'logout', to: 'sessions#destroy'
  resources :users, only: [:show]
  resources :userfavorites, only: [:index]
  
end
