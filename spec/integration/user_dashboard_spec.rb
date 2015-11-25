require "rails_helper"

  def log_in_for_test
   user = User.create(username: "Oscar", 
                email: "oscillo@gmail.com", 
                password: "oscarpalito", 
                password_confirmation: "oscarpalito")
    visit login_path

       fill_in "email", with: user.email
       fill_in "password", with: "oscarpalito"

      page.find("input[type='submit']").click

      user
  end

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
     visit "/dashboard"

      expect(page).to have_content("victims and counting")
    end


    it "the page should display automatically generated short links" do
      User.create(username: "Oscillo", 
                  email: "oscarpalito@gmail.com", 
                  password: "oscarpistorius", 
                  password_confirmation: "oscarpistorius") 

      visit "/login"

      fill_in "email", with: "oscarpalito@gmail.com"
      fill_in "password", with: "oscarpistorius"
      page.find("input[type='submit']").click

      expect(page).to have_content("Welcome Oscillo")


    end
  end

  describe "User Dashboard" do
    context "when the user tries to shorten links that have toggled active or inactive"
    it "should automatically redirect to the long_url if the short url is active" do 
      user = log_in_for_test
      link = Link.create(long_url: "http://tushot.heroku.com", 
                  short_url: "oscar", 
                  clicks: 3, 
                  user_id: 1,
                  active: true)
      visit "/dashboard"

      within(".recent-left")  do
         find("a[href='/oscar']").click
      end
      expect(page).to have_content(" ...and it became tushot!")
    end


    it "should automatically redirect to the long_url if the short url has been assigned to another link" do 
      user = log_in_for_test
      link = Link.create(long_url: "http://www.futuretest.com", 
                  short_url: "oscar", 
                  clicks: 3, 
                  user: user,
                  active: false)
        visit "/dashboard"
        expect(page).to have_content("Welcome Oscar")
        expect(page).to have_content("input custom url here:")
        within(".recent-left")  do
           find("a[href='/oscar']").click
         end
        expect(page).to have_content(" ...and it became tushot!")
        expect(page).to have_content("Notorious Fugitives")
      end
 

    it "should navigate to the details page if the " do 
      user = log_in_for_test
      link = Link.create(long_url: "http://www.futuretest.com", 
                  short_url: "oscar", 
                  clicks: 3, 
                  user: user,
                  active: false)
      details = Detail.create(referrer: "www.tushot-heroku.com",
                        location: "Bulgaria",
                        browser: "Chrome",
                        link: link)
        visit "/dashboard"
        expect(page).to have_content("Welcome Oscar")
        expect(page).to have_content("input custom url here:")
        within(".popular-right")  do
           find("a[href='/dashboard/oscar']").click
         end
        expect(page).to have_content("YOUR DETAILS EXIST HERE")
        expect(page).to have_content("Old Url")
        expect(page).to have_content("Bulgaria")
        expect(page).to have_content("Chrome")
        expect(page).to have_content('www.tushot-h...')
        expect(page).to have_content("New Url")
        expect(page).to have_content("Clicks")
        expect(page).to have_content("Location")
        expect(page).to have_content("Referrer")
        expect(page).to have_content("http://www.futuretest.com")
        expect(page).to have_content("Edit")
        expect(page).to have_content("Long Url")
        expect(page).to have_content("Delete")
        expect(page).to have_content("Back to Dashboard")
      end

    it "should navigate to the details page if the " do 
      user = log_in_for_test
      link = Link.create(long_url: "http://www.futuretest.com", 
                  short_url: "oscar", 
                  clicks: 3, 
                  user: user,
                  active: false)
      details = Detail.create(referrer: "www.tushot-heroku.com",
                        location: "Bulgaria",
                        browser: "Chrome",
                        link: link)
        visit "/dashboard"
        expect(page).to have_content("Welcome Oscar")
        expect(page).to have_content("input custom url here:")
        within(".popular-right")  do
           find("a[href='/dashboard/oscar']").click
        end
        click_link("Delete")
      expect(Link.count).to eql 0
    end
  end
end
