Rails.application.routes.draw do

  resources :users, only: [:create, :update, :index], defaults: { format: :json }
  post 'authenticate' => 'auth#authenticate'

  resources :posts

  post 'submit_demo_request' => 'pages#submit_demo_request'
end

