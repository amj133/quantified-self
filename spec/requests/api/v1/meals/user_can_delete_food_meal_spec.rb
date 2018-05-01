require 'rails_helper'

describe "user can delete a food meal relation" do
  before(:each) do
    dinner = create(:meal, id: 1, name: "dinner")
    squash = create(:food, id: 1, name: "squash")
    FoodMeal.create(meal: dinner, food: squash)
  end

  context "delete /api/v1/meals/:meal_id/foods/:id" do
    it "removes association and returns message" do
      dinner = Meal.last

      expect(dinner.foods.count).to eq(1)

      delete '/api/v1/meals/1/foods/1'

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message[:message]).to eq("Successfully removed squash from dinner")
      expect(dinner.foods.count).to eq(0)
    end

    it "returns 404 if meal not found" do
      dinner = Meal.last

      expect(dinner.foods.count).to eq(1)

      delete '/api/v1/meals/2/foods/1'

      expect(response.status).to eq(404)
      expect(dinner.foods.count).to eq(1)
    end

    it "returns 404 if food not found" do
      dinner = Meal.last

      expect(dinner.foods.count).to eq(1)

      delete '/api/v1/meals/1/foods/2'

      expect(response.status).to eq(404)
      expect(dinner.foods.count).to eq(1)
    end
  end
end
