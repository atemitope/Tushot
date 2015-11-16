class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dashboard"
      flash[:notice] = "Account created successfully"
    else
      flash[:notice] = "An error occurred!"
      render "new"
    end
  end


def dashboard
  @user = User.find_by(params[:id])
  if  !current_user
    redirect_to "/login" 
    flash[:notice] = "you have to be signed in"
  end
  @link = Link.new
  @user_links = @user.links.most_recent_links.page(params[:page]).per(4)
  @user_popular_links = @user.links.most_popular_links.page(params[:page]).per(4)
  @count = @user.links.count
end


def show

end



  private
#grants permission to parameters coming from the browser
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
