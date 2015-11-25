class LinksController < ApplicationController
  require 'browser'

  before_action :authorize_user_for_short_url,:check_default, only: [:create] 

  def index
    @link = Link.new
    @most_recent_links = Link.all.most_recent_links.limit(4)
    @most_popular_links = Link.all.most_popular_links.limit(4)
    @most_popular_users = User.all.most_popular_users.limit(4)
    @count = Link.all.count
  end

  def create#           respond_to do |format|
#             format.html
#             format.js {render layout: false}
#           end
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link if current_user
          flash[:notice] = "Link successfully created"

    else
      @check = "display"
      flash[:notice] = Link.find_by(short_url: @default_short_params) ?  "Short Url already exists. Try Again" : "Error generating Link, Try Again"   
    end
  end


  def show
    @link = Link.find_by(short_url: params[:id])

    if @link && @link.active
      @link.increment_click
      @link.details.build(location: request.location.data['country_name'], referrer: request.referrer, browser: convert_to_device)
      @link.save
      redirect_to @link.long_url
    elsif @link && @link.active == false
      flash[:success] =  "The requested Shot has been disabled"
      redirect_to root_url
    else
      flash[:success] =  "The Shot you are looking for doesnt exist"
      redirect_to root_url
    end
  end

  def dashboard

  end

  def details
    # require 'pry'; binding.pry
    if  !current_user
      redirect_to "/login" 
      flash[:notice] = "you have to be signed in"
    end
    @link_details = Link.find_by(short_url: params[:short_url])
    @browser = Detail.link_details_browser(@link_details.id)
    @location = Detail.link_details_location(@link_details.id)
    @referrer = Detail.link_details_referrer(@link_details.id)
  end

  def update
    @link_details = Link.find_by(id: params[:id])
    @link_details.update(link_params)
    flash[:success] = "Link Updated"
    redirect_to "/dashboard"
  end

  def destroy
    require 'pry'; binding.pry
    @link = Link.find(params[:id])
    if @link.user_id == current_user.id
      @link.destroy
      flash[:success] = "Shot Deleted successfully!"
      redirect_to "/dashboard"
    else
      flash[:success] = "You cannot delete this SHot!!"
      redirect_to root_path
    end
  end

  def convert_to_device
    browser = ::Detector.new
    browser_agent = browser.browser_detection(request.env['HTTP_USER_AGENT'])
    return browser_agent
  end

  private
  #specifying only trusted parameters from the Internet
    def link_params
      params.require(:link).permit(:long_url, :short_url)
    end

    def authorize_user_for_short_url
      params[:link][:short_url] = nil unless current_user
    end

    def check_default
      if params[:link][:short_url]
        @default_short_params = params[:link][:short_url]
        params[:link][:short_url] = nil if params[:link][:short_url].empty? 
      end
    end
end


