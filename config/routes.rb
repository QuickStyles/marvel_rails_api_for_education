Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :characters, only: [:index]
      resources :users, only: [:create]
      resource :session, only: [:create, :destroy]
      resources :decks, only: [:create]
      get '/users/current', to: "users#current" # GET /api/v1/users/current => UsersController#current
    end
    

  end
end
