Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users
  
  devise_scope :users do
    get '/u/:id', to: 'users#show', as: 'user'     
  end
  resources :messages, except: :destroy
  get '/success', to: 'messages#success'
  
  delete '/messages/:id', to: 'messages#destroy_sent', as: 'delete_sent_message'
  delete '/messages/:id', to: 'messages#destroy_received', as: 'delete_received_message'
end
