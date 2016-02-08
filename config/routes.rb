Rails.application.routes.draw do

  resources :users, only: [:create, :update], defaults: { format: :json }

end

