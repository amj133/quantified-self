class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show
    begin
      food = Food.find(params[:id])
    rescue
      render status: 400, json: {message: "Food not found"}
      return
    end
    render json: Food.find(params[:id])
  end

  def create
    food = Food.new(name: params["food"]["name"],
                    calories: params["food"]["calories"])
    if food.save
      render json: food
    else
      render status: 400, json: {message: "Must provide name and calories for new food"}
    end
  end

  def update
    food = Food.find(params["id"])
    new_name = params["food"]["name"]
    new_calories = params["food"]["calories"].to_i
    food.update(name: new_name, calories: new_calories)

    render json: food
  end

  def destroy
    begin
      food = Food.find(params["id"])
      food.destroy
    rescue
      render status: 404, json: {message: "Food not found"}
      return
    end
    render status: 204, json: {message: "Food deleted"}
  end

end
