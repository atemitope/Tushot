
class SessionsController < ApplicationController
  def new
    redirect_to "/dashboard" if current_user
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
=begin
    Save the user id inside the browser cookie. 
    This is how we keep the user logged in 
    when they navigate around our website.
=end
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
    # If user"s login doesn"t work, send them back to the login form.
      flash[:notice] = "Incorrect Username or password!"
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end