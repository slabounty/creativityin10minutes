require 'rails_helper'

RSpec.describe Medium, type: :model do
  let (:medium) { Medium.new }

  describe "basic methods" do
    it "responds to name" do
      expect(medium).to respond_to(:name)
    end

    it "responds to description" do
      expect(medium).to respond_to(:description)
    end
  end
end
