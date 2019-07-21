# frozen_string_literal: true

require "spec_helper"

feature "Visiting world", js: true do
  scenario "visiting world" do
    visit "/world"

    expect(page).to have_content("world")
  end
end
