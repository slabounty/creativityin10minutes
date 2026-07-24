require 'rails_helper'

RSpec.describe Prompt, type: :model do
  it { respond_to :title }
  it { respond_to :instructions }
  it { respond_to :category }
  it { respond_to :active }
end
