require 'rails_helper'

describe Food do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
  end

  context "relationships" do
    it { should have_many(:food_meals) }
    it { should have_many(:meals).through(:food_meals) }
  end
end
