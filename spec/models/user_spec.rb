require 'rails_helper'

RSpec.describe User, type: :model do
  it { respond_to :email }
end
