require "rails_helper"

RSpec.describe "Login", type: :request do
  let!(:user) do
    User.create!(
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  describe "GET /session/new" do
    it "returns success" do
      get new_session_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /session" do
    it "logs the user in" do
      post session_path, params: {
        email_address: user.email_address,
        password: "password"
      }

      expect(response).to redirect_to(home_path)
    end
  end
end
