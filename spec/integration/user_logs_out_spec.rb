# require "rails_helper"

# RSpec.describe "User Logs Out", type: :feature do
#   context "when a logged in user logs out" do
#     it "the page should prompt the user for confirmation ",:js => true do 
#       User.create(username: "oscar", 
#                   email: "oscillo@gmail.com", 
#                   password: "oscarpistorius", 
#                   password_confirmation: "oscarpistorius")

#       visit "/login"

#       fill_in "email", with: "oscillo@gmail.com"
#       fill_in "password", with: "oscarpistorius"

#       click_button "submit"

#       click_link "Logout" 

#       page.accept_alert 'Are you sure?' do
#         click_button('OK')
#       expect(page).to have_content("and it became tushot")
#       end
#     end
#   end
# end
