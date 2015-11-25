require 'rails_helper'

  def log_in_for_test
    User.create(username: "Oscar", 
                email: "oscillo@gmail.com", 
                password: "oscarpalito",
                password_confirmation: "oscarpalito")
    visit login_path

       fill_in "email", with: "oscillo@gmail.com"
       fill_in "password", with: "oscarpalito"

      page.find("input[type='submit']").click
  end

  
