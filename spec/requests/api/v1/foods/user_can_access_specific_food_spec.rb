require 'rails_helper'

describe "foods finder api" do
  before(:all) do
    create(:food, id: 1, name: "Name-1")
    create(:food, id: 2, name: "Name-2")
  end

  context "GET /api/v1/foods/:id" do
    it "returns a specific food" do
      get "/api/v1/foods/1"

      food = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(food[:name]).to eq("Name-1")
    end

    it "returns a 400 if food not found" do
      get "/api/v1/foods/3"

      food = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
    end
  end
end
