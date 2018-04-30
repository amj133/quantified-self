require 'rails_helper'

describe "foods finder api" do
  before(:each) do
    Food.create!(id: 1, name: "Banana", calories: 100)
  end

  context "PATCH /api/v1/foods/:id" do
    it "returns updated food" do
      updated_food = { "food":
                       { "name": "Mint", "calories": "14"} }
      patch "/api/v1/foods/1", params: updated_food

      food = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(food[:name]).to eq("Mint")
      expect(food[:calories]).to eq(14)
      expect(Food.find(1).calories).to eq(14)
    end
  end
end
