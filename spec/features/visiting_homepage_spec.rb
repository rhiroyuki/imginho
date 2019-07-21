# frozen_string_literal: true

require "spec_helper"

feature "as a user, visiting the homepage" do
  context "when visiting the root url" do
    scenario "user is able to see the title content" do
      visit "/"

      expect(page).to have_selector("h2", text: "URL Shortner")
    end
  end
end
