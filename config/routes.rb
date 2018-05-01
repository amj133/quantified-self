Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :foods, only: [:index, :show, :create, :update, :destroy]
      resources :meals, only: [:index] do
        get '/foods', to: 'meal_foods#index'
        post '/foods/:id', to: 'meal_foods#create'
      end
    end
  end

end
