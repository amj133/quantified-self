Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show, :create, :update, :destroy]
      resources :meals, only: [:index] do
        get '/foods', to: 'food_meals#index'
        post '/foods/:id', to: 'food_meals#create'
        delete '/foods/:id', to: 'food_meals#destroy'
      end
    end
  end

end
