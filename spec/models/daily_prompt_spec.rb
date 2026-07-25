require 'rails_helper'

RSpec.describe DailyPrompt, type: :model do
  let (:daily_prompt) { DailyPrompt.new }

  describe "basic methods" do
    it "responds to prompt_date" do
      expect(daily_prompt).to respond_to(:prompt_date)
    end

    it "responds to prompt" do
      expect(daily_prompt).to respond_to(:prompt)
    end

    it "responds to medium" do
      expect(daily_prompt).to respond_to(:medium)
    end
  end
end
