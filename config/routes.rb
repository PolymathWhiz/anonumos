Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users
  
  devise_scope :users do
    get '/u/:id', to: 'users#show', as: 'user'     
  end
  resources :messages
end
