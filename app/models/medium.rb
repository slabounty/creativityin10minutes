class Medium < ApplicationRecord
  has_many :daily_prompts, dependent: :restrict_with_exception

  def self.random
    order(Arel.sql("RANDOM()")).first
  end
end
