require "rails_helper"

RSpec.describe "Authentication", type: :request do
  it "redirects guests away from the home page" do
    get home_path

    expect(response).to redirect_to(new_session_path)
  end

  it "allows guests to see the splash page" do
    get root_path

    expect(response).to have_http_status(:ok)
  end

  it "allows guests to visit the signup page" do
    get new_user_path

    expect(response).to have_http_status(:ok)
  end

  it "allows guests to visit the login page" do
    get new_session_path

    expect(response).to have_http_status(:ok)
  end
end
