# frozen_string_literal: true

describe HelloWorldController, type: :controller do
  it "returns a body containing HelloWorld" do
    get "/"

    expect(last_response.body).to eq("HelloWorld")
  end

  it "returns status 201" do
    get "/"

    expect(last_response).to be_successful
    expect(last_response.status).to eq(201)
  end
end
