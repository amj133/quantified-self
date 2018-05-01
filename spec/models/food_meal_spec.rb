require 'rails_helper'

describe FoodMeal do
  context "relationships" do
    it { should belong_to(:food) }
    it { should belong_to(:meal) }
  end
end
