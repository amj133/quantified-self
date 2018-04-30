class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show
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

end
