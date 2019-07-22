# frozen_string_literal: true

require "spec_helper"

feature "image upload at homepage" do
  scenario "visitor uploads an image" do
    visit "/"

    within("form") do
      fill_in "description", with: "Nature in Portugal"
      attach_file("file", "spec/fixtures/nature.jpg")
    end

    click_button("Upload Image")

    expect(page).to have_content("Upload done")
  end
end
