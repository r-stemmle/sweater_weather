Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resource :forecast, only: :show
      resources :backgrounds, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
      resource :road_trip, only: :create
    end
  end
end
