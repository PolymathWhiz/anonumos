Rails.application.routes.draw do
  resources :messages
  root to: 'pages#home'
  
  devise_for :users
  
  devise_scope :users do
    # resources :users, only: :show
    get '/u/:id', to: 'users#show', as: 'user'     
  end
end
