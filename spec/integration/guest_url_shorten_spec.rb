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

  context "when user visits the homepage" do
    it "the page should have a helpful description" do
      visit root_path
      click_link "Login"
      expect(page).to have_content("Email:")
      expect(page).to have_content("Password:")
  end
end


  context "when user visits the homepage" do
    it "the page should have a helpful description" do
      visit root_path
      click_link "Signup"
      expect(page).to have_content("Email:")
      expect(page).to have_content("Password:")
      expect(page).to have_content("Username:")
      expect(page).to have_content("Password Confirmation:") 
  end
end

  context "when user visits the homepage" do
    it "the page should have a helpful description" do
      visit root_path
      fill_in "link[long_url]", with: "http://minly.heroku.com"
      expect {
        find(".cut").click
      }.to change{Link.count}.by 1
      
  end

  it "doesn't shorten invalid url" do
      expect(Link.count).to eql 0
      visit root_path
      fill_in "link[long_url]", with: "httpsdfs.comsdf"
      find(".cut").click
      expect(Link.count).not_to eql 1
  end
end

  context "when user visits the homepage" do
    it "the page should have a helpful description" do
      visit '/signup'
      fill_in "user[username]", with: "oscillo"
      fill_in "user[email]", with: "oscillo@yahoo.com"
      fill_in "user[password]", with: "oscarpistorius"
      fill_in "user[password_confirmation]", with: "oscarpistorius"
      expect {
        find(".account_submit").click
      }.to change{User.count}.by 1  
    end


    it "the page should have a helpful description" do
      expect(User.count).to eql 0
      visit '/signup'
      fill_in "user[username]", with: ""
      fill_in "user[email]", with: "oscillo@yahoo.com"
      fill_in "user[password]", with: "oscarpistorius"
      fill_in "user[password_confirmation]", with: "oscarpistorius"
      find(".account_submit").click
      expect(Link.count).not_to eql 1
    end

    it "the page should have a helpful description" do
      expect(User.count).to eql 0
      visit '/signup'
      fill_in "user[username]", with: "oscillo"
      fill_in "user[email]", with: ""
      fill_in "user[password]", with: "oscarpistorius"
      fill_in "user[password_confirmation]", with: "oscarpistorius"
      find(".account_submit").click
      expect(Link.count).not_to eql 1
    end


    it "the page should have a helpful description" do
      expect(User.count).to eql 0
      visit '/signup'
      fill_in "user[username]", with: "oscillo"
      fill_in "user[email]", with: "oscillo@gmail.com"
      fill_in "user[password]", with: ""
      fill_in "user[password_confirmation]", with: "oscarpistorius"
      find(".account_submit").click
      expect(Link.count).not_to eql 1
    end

    it "the page should have a helpful description" do
      expect(User.count).to eql 0
      visit '/signup'
      fill_in "user[username]", with: "oscillo"
      fill_in "user[email]", with: "oscillo@gmail.com"
      fill_in "user[password]", with: "oscarpistorius"
      fill_in "user[password_confirmation]", with: ""
      find(".account_submit").click
      expect(Link.count).not_to eql 1
    end
  end

  context "when user visits the homepage" do
    it "the page should have a helpful description" do
      visit '/signup'
      fill_in "user[username]", with: "oscillo"
      fill_in "user[email]", with: "oscillo@yahoo.com"
      fill_in "user[password]", with: "oscarpistorius"
      fill_in "user[password_confirmation]", with: "oscarpistorius"
      expect {
        find(".account_submit").click
      }.to change{User.count}.by 1  
    end

    it "the page should have a helpful description" do
      visit '/signup'
      fill_in "user[username]", with: "oscillo"
      fill_in "user[email]", with: "oscillo@yahoo.com"
      fill_in "user[password]", with: "oscarpistorius"
      fill_in "user[password_confirmation]", with: "oscarpistorius"
      find(".account_submit").click
      expect(page).to have_content("Welcome oscillo")
      expect(page).to have_content("Account created successfully")
      expect(page).to have_content("Logout")
      expect(page).to have_content("you can input your custom url below")
      expect(page).to have_content("Paste your long URL here:")
      expect(page).to have_content("victims and counting")
      expect(page).to have_content("Recent")
      expect(page).to have_content("Most Popular")
      expect(page).to have_content("Old Url")
      expect(page).to have_content("New Url")
      expect(page).to have_content("Clicks")
    end
  end
end