require "rails_helper"

RSpec.describe "Signup", type: :request do
  describe "GET /users/new" do
    it "returns success" do
      get new_user_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /users" do
    it "creates a user" do
      expect {
        post users_path, params: {
          user: {
            email_address: "test@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }
      }.to change(User, :count).by(1)
    end

    it "redirects to the home page" do
      post users_path, params: {
        user: {
          email_address: "test@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }

      expect(response).to redirect_to(home_path)
    end
  end
end
