Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cards, only: [:index]
      resources :users, only: [:create]
      resource :session, only: [:create, :destroy]
      resources :decks, only: [:create]
      get '/users/current', to: "users#current" # GET /api/v1/users/current => UsersController#current
      get '/users/decks', to: "users#current_user_decks" # GET /api/v1/users/decks => UsersController#current_user_decks
    end
    

  end
end
