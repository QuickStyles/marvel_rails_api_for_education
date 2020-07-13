Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :characters, only: [:index]
      resources :users, only: [:create]
      resource :session, only: [:create, :destroy]
    end
    

  end
end
