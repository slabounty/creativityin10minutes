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

  describe ".for_today" do
    before do
      Prompt.create!(
        title: "Draw a Mug",
        instructions: "Draw your favorite mug.",
        category: "Observation"
      )

      Medium.create!(
        name: "Pencil",
        description: "Simple graphite pencil."
      )
    end

    it "creates today's prompt if one does not exist" do
      expect {
        DailyPrompt.for_today
      }.to change(DailyPrompt, :count).by(1)
    end

    it "returns the existing prompt if called twice" do
      first = DailyPrompt.for_today
      second = DailyPrompt.for_today

      expect(first).to eq(second)
      expect(DailyPrompt.count).to eq(1)
    end
  end
end
