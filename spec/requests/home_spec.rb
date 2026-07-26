require "rails_helper"

RSpec.describe "Home", type: :request do
  let!(:user) do
    User.create!(
      email_address: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  before do
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

  it "displays the prompt and medium" do
    get home_path

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Draw a Mug")
    expect(response.body).to include("Pencil")
  end
end
