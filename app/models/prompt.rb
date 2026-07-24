class Prompt < ApplicationRecord
  has_many :daily_prompts, dependent: :restrict_with_exception

  validates :title, presence: true
  validates :instructions, presence: true
  validates :category, presence: true
end
