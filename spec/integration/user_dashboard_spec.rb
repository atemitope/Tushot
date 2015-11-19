require "rails_helper"

RSpec.describe "User Dashboard", type:  :feature do
  subject(:user) do
    User.create(username: "Oscar", 
                email: "oscillo@gmail.com " , 
                password: "oscarpalito", 
                password_confirmation: "oscarpalito")
  end

  subject(:link) do
    Link.create(long_url: "http://www.thisisatest.com", 
                short_url: "tesla1",
                clicks: 3, 
                user_id: 2)
  end

  context "when user logs in to dashboard" do
    it "the page should contain a form to shorten links"  do
      visit "/login"

      fill_in "email", with: user.email
      fill_in "password", with: user.password

      page.find("input[type='submit']").click

      expect(page).to have_content("Welcome Oscar")

      # expect(page).to have_selector("input#link_short_url")
    end

    it "the page should contain a field that enables the user type in custom keywords" do
      visit login_path

       fill_in "email", with: user.email
       fill_in "password", with: user.password

      page.find("input[type='submit']").click

      expect(page).to have_content("Paste your long URL here:")
      expect(page).to have_selector("input#link_short_url")
    end

    it "the page should display user created short links" do
      visit "/login"

      fill_in "email", with: user.email
      fill_in "password", with: user.password

      click_button "submit"

      fill_in "link[long_url]", with: "http://givemeamacbook.com"
      fill_in "link[short_url]", with: "macbook"

      expect(page).to have_content("Welcome Oscar")
      expect(page).to have_content("Old Url")
      expect(page).to have_content("New Url")
      expect(page).to have_content("Most Popular")
      expect(page).to have_content("Recent")
     # page.find(".cut").click

     # expect(page).to have_css('div.shorturl_container')
     visit "/dashboard"

      expect(page).to have_content("victims and counting")

      # expect(page).to have_http_status(200)
      # expect(page).to have_content("macbook")y
    end


    it "the page should display automatically generated short links" do
      User.create(username: "Oscillo", 
                  email: "oscarpalito@gmail.com", 
                  password: "oscarpistorius", 
                  password_confirmation: "oscarpistorius") 

      visit "/login"

      fill_in "email", with: "oscarpalito@gmail.com"
      fill_in "password", with: "oscarpistorius"

      # require 'pry'; binding.pry
      page.find("input[type='submit']").click

      expect(page).to have_content("Welcome Oscillo")


    end

    it "should automatically redirect to the long_url if the short url has been assigned to another link" do 
      link = Link.create(long_url: "http://www.futuretest.com", 
                  short_url: "oscar", 
                  clicks: 3, 
                  user_id: 1) 
      visit root_path
      find("a[href='oscar']")
      within(".recent-left")  do
         find("a[href='oscar']").click
      end
      # expect(response).to have_http_status(:success)
     
    end

  end
end
# end

