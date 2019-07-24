# frozen_string_literal: true

require "spec_helper"

feature "image upload at homepage" do
  scenario "visitor uploads an image" do
    visit "/"

    within("form") do
      attach_file("image", "spec/fixtures/nature.jpg")
      fill_in "description", with: "Nature in Portugal"

      click_button("Upload Image")
    end

    expect(page).to have_content("Upload done")
  end
end
