require 'rails_helper'

describe "meals finder api" do
  before(:each) do
    breakfast = create(:meal, name: "Breakfast")
    banana = create(:food, name: "Banana")
    oatmeal = create(:food, name: "Oatmeal")
    FoodMeal.create(meal: breakfast, food: banana)
    FoodMeal.create(meal: breakfast, food: oatmeal)

    snack = create(:meal, name: "Snack")
    cheese = create(:food, name: "Cheese")
    FoodMeal.create(meal: snack, food: cheese)
  end

  context "GET /api/v1/meals" do
    it "returns all meals and associated foods" do
      get "/api/v1/meals"

      meals = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(meals.first[:name]).to eq("Breakfast")
      expect(meals.first[:foods].first[:name]).to eq("Banana")
      expect(meals.first[:foods].last[:name]).to eq("Oatmeal")
      expect(meals.last[:name]).to eq("Snack")
      expect(meals.last[:foods].last[:name]).to eq("Cheese")
    end
  end
end
