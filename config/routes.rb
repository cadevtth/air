Air::Application.routes.draw do
  
  get '/mockup' => 'pages#home'
  
  # root to: 'pages#home'
  
  get '/help' => 'pages#help', :as => :help
  
end
