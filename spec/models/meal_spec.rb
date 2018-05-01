require 'rails_helper'

describe Meal do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "relationships" do
    it { should have_many(:food_meals) }
    it { should have_many(:foods).through(:food_meals) }
  end
end
