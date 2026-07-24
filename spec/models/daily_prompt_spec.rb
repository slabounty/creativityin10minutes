require 'rails_helper'

RSpec.describe DailyPrompt, type: :model do
  it { respond_to :prompt_date }
  it { respond_to :prompt }
  it { respond_to :medium }
end
