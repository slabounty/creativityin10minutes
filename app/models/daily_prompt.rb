class DailyPrompt < ApplicationRecord
  belongs_to :prompt
  belongs_to :medium

  validates :prompt_date, presence: true
  validates :prompt_date, uniqueness: true
end
