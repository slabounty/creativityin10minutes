class Prompt < ApplicationRecord
  has_many :daily_prompts, dependent: :restrict_with_exception

  validates :title, presence: true
  validates :instructions, presence: true
  validates :category, presence: true

  def self.random
    order(Arel.sql("RANDOM()")).first
  end
end
