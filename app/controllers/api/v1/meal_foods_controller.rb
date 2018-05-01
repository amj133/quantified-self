class Api::V1::MealFoodsController < ApplicationController

  def index
    meal = Meal.find(params["meal_id"])

    render json: meal
  end

  def create
    begin
      meal = Meal.find(params["meal_id"])
      food = Food.find(params["id"])
    rescue 
      render status: 404, json: {message: "Food or meal not found :/"}
      return
    end
    FoodMeal.create(meal: meal, food: food)
    render status: 201, json: {message: "Successfully added #{food.name} to #{meal.name}"}
  end

end
