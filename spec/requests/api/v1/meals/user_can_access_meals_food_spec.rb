require 'rails_helper'

describe "meals finder api" do
  before(:each) do
    breakfast = create(:meal, name: "Breakfast")
    banana = create(:food, name: "Banana")
    oatmeal = create(:food, name: "Oatmeal")
    FoodMeal.create(meal: breakfast, food: banana)

    snack = create(:meal, name: "Snack")
    cheese = create(:food, name: "Cheese")
    monkey_brain = create(:food, name: "Monkey Brain")
    FoodMeal.create(meal: snack, food: cheese)
    FoodMeal.create(meal: snack, food: monkey_brain)
  end

  context "GET /api/v1/meals/1/foods" do
    it "returns all foods associated with a meal" do
      get "/api/v1/meals/2/foods"

      meal = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(meal[:name]).to eq("Snack")
      expect(meal[:foods].first[:name]).to eq("Cheese")
      expect(meal[:foods].last[:name]).to eq("Monkey Brain")
    end
  end
end
