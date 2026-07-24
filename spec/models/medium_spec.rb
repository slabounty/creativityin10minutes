require 'rails_helper'

RSpec.describe Medium, type: :model do
  it { respond_to :name }
  it { respond_to :description }
  it { respond_to :active }
end
