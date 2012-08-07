Air::Application.routes.draw do
  
  resources :users

  get '/mockup' => 'pages#home'
  
  root to: 'flights#index'
  
  get '/help' => 'pages#help', :as => :help
  
end
