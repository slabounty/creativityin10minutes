require "rails_helper"

RSpec.describe "Logout", type: :request do
  let!(:user) do
    User.create!(
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "redirects to the splash page" do
    post session_path, params: {
      email_address: user.email_address,
      password: "password"
    }

    delete session_path

    expect(response).to redirect_to(root_path)
  end
end
