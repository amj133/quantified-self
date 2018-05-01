require 'rails_helper'

describe "user can add food to a meal" do
  before(:each) do
    create(:meal, id: 1, name: "dinner")
    create(:food, id: 1, name: "squash")
  end

  context "POST /api/v1/meals/:meal_id/foods/:id" do
    it "returns 201 with success message" do
      meal = Meal.last
      expect(meal.foods.count).to eq(0)

      post '/api/v1/meals/1/foods/1'

      message = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(message[:message]).to eq("Successfully added squash to dinner")

      expect(meal.foods.count).to eq(1)
    end

    it "returns 404 if meal not found" do
      post '/api/v1/meals/2/foods/1'

      expect(response.status).to eq(404)
    end

    it "returns 404 if food not found" do
      post '/api/v1/meals/1/foods/2'

      expect(response.status).to eq(404)
    end
  end
end
