require 'rails_helper'

describe "foods finder api" do
  context "GET /api/v1/foods" do
    it "provides access to all foods" do
      get "/api/v1/foods"

      foods = JSON.parse(response.body)

      expect(response).to be_success
      expect(foods.first[:id]).to eq(1)
      expect(foods.last[:id]).to eq(2)
    end
  end
end
