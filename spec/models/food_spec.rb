require 'rails_helper'

describe Food do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:calories) }
  end
end
