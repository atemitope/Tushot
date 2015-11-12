require "rails_helper"

RSpec.describe "shortening_links", type: :feature do
  context "when user visits the homepage" do
    it "the page should have a helpful description" do
      visit root_path
      expect(page).to have_content("and it became tushot")
      expect(page).to have_content("Paste your long URL here:")
      expect(page).to have_content("Login")
      expect(page).to have_content("Signup")
    end
  end
end