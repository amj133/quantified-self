require 'rails_helper'

describe "meals finder api" do
  before(:each) do
    Food.create!(id: 1, name: "Banana", calories: 100)
  end

  context "GET /api/v1/meals" do
    it "returns all meals and associated foods" do
      get "/api/v1/meals"

      meals = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(meals.first[:name]).to eq("Breakfast")
      expect(meals.first[:name][:foods].first[:name]).to eq("Banana")
      expect(meals.last[:name]).to eq("Snack")
      expect(meals.last[:name][:foods].last[:name]).to eq("Cheese")
    end
  end
end
