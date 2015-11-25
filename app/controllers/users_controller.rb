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
      flash[:success] = "An error occurred!"
      render "new"
    end
  end

def dashboard
  @user = current_user
  if  !current_user
    redirect_to "/login" 
    flash[:notice] = "you have to be signed in"
  end
  @link = Link.new
  @count = @user.links.count
  @recent_links = @user.links.most_recent_links.page(params[:recent_links]).per(5)
  @popular_links = @user.links.most_popular_links.page(params[:popular_links]).per(4)
end

def show
end



  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
