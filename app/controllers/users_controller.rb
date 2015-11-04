class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account created successfully"
    else
      flash[:error] = "An error occurred!"
      render "new"
    end
  end


def dashboard
  params[:id] = 1
 user = User.find(params[:id])
 @link = Link.new
  if  !current_user
    redirect_to "/login"
    # notice: "you have to be signed in"
  end
end

# create a current user method in application controller 



  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
