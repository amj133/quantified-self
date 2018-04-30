require 'rails_helper'

describe "foods finder api" do
  before(:all) do
    create_list(:food, 3)
  end

  context "GET /api/v1/foods" do
    it "provides access to all foods" do
      get "/api/v1/foods"

      foods = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(foods.first[:name]).to eq("Name-1")
      expect(foods.last[:name]).to eq("Name-3")
    end
  end
end
