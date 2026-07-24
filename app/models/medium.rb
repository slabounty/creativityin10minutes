class Medium < ApplicationRecord
  has_many :daily_prompts, dependent: :restrict_with_exception

end
