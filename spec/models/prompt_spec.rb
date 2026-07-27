require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

RSpec.describe Prompt, type: :model do
  let (:prompt) { Prompt.new }

  describe "basic methods" do
    it "responds to title" do
      expect(prompt).to respond_to(:title)
    end

    it "responds to instructions" do
      expect(prompt).to respond_to(:instructions)
    end

    it "responds to category" do
      expect(prompt).to respond_to(:category)
    end
  end
end
