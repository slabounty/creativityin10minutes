class DailyPrompt < ApplicationRecord
  belongs_to :prompt
  belongs_to :medium

  validates :prompt_date, presence: true
  validates :prompt_date, uniqueness: true

  def self.for_today
    find_or_create_by!(prompt_date: Date.current) do |daily_prompt|
      daily_prompt.prompt = Prompt.random
      daily_prompt.medium = Medium.random
    end
  end
end
