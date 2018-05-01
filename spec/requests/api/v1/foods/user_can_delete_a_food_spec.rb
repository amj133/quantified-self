require 'rails_helper'

describe "foods finder api" do
  before(:each) do
    Food.create!(id: 1, name: "Banana", calories: 100)
  end

  context "DELETE /api/v1/foods/:id" do
    it "deletes food and returns 204" do
      delete "/api/v1/foods/1"

      expect(response.status).to eq(204)
      expect(Food.count).to eq(0)
    end

    it "returns a 404 if food not found" do
      delete "/api/v1/foods/2"

      expect(response.status).to eq(404)
    end
  end
end
