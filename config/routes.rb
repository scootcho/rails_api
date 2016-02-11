Rails.application.routes.draw do

  resources :users, only: [:create, :update, :index], defaults: { format: :json }
  post 'authenticate' => 'auth#authenticate'

  post 'submit_demo_request' => 'pages#submit_demo_request'

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end

