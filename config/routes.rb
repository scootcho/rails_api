Rails.application.routes.draw do

  resources :users, only: [:create, :update, :index], defaults: { format: :json }
  post 'authenticate' => 'auth#authenticate'
end

