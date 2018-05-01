class Api::V1::FoodMealsController < ApplicationController

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

  def destroy
    begin
      food = Food.find(params["id"])
      meal = Meal.find(params["meal_id"])
      food_meal = FoodMeal.where("food_id = ? AND meal_id = ?", food.id, meal.id)
      food_meal.first.destroy
    rescue
      render status: 404, json: {message: "Food or meal not found :/"}
      return
    end
    render json: {message: "Successfully removed #{food.name} from #{meal.name}"}
  end

end
