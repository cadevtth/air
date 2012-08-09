Air::Application.routes.draw do
  
  get "sessions/new" => 'sessions#new', :as => :new_session
  post "sessions" => 'sessions#create', :as => :sessions
  
  delete "/logout" => 'sessions#destroy', :as => :signout
  
  resources :users

  get '/mockup' => 'pages#home'
  
  root to: 'flights#index'
  
  get '/help' => 'pages#help', :as => :help
  
end
