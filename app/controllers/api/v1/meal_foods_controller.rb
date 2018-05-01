class Api::V1::MealFoodsController < ApplicationController

  def index
    meal = Meal.find(params["meal_id"])

    render json: meal
  end

end
