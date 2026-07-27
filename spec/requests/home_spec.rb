require "rails_helper"
include ActiveSupport::Testing::TimeHelpers

RSpec.describe "Home", type: :request do
  let!(:user) do
    User.create!(
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  before do
    travel_to(Time.parse("2026-07-14"))

    Prompt.create!(
      title: "Draw a Mug",
      instructions: "Draw your favorite mug.",
      category: "Observation"
    )

    Medium.create!(
      name: "Pencil",
      description: "Simple graphite pencil."
    )

    sign_in(user)
  end

  it "displays the date, prompt and medium" do
    get home_path

    expect(response).to have_http_status(:ok)

    expect(response.body).to include("Today's Prompt")

    # Check that the date is shown.
    expect(response.body).to include("Tuesday")
    expect(response.body).to include("July")
    expect(response.body).to include("14")
    expect(response.body).to include("2026")

    expect(response.body).to include("Draw a Mug")
    expect(response.body).to include("Pencil")
  end
end
