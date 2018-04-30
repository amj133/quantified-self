require 'rails_helper'

describe "foods finder api" do
  before(:all) do
    create(:food, name: "Name-1", id: 1, calories: 100)
  end

  context "POST /api/v1/foods" do
    it "creates and returns a new food" do
      new_food = { "food":
                   { "name": "Name-1",
                     "calories": "200"} }
      post "/api/v1/foods", params: new_food

      food = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(food[:name]).to eq("Name-1")
      expect(food[:calories]).to eq(200)
      expect(Food.find(1).calories).to eq(200)
    end
  end
end
