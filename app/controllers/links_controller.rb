class LinksController < ApplicationController
  require 'browser'

  before_action :authorize_user_for_short_url,:check_default, only: [:create] 

  def index
    @link = Link.new
    @most_recent_links = Link.all.most_recent_links.limit(4)
    @most_popular_links = Link.all.most_popular_links.limit(4)
    @most_popular_users = User.all.most_popular_users
    @count = Link.all.count
  end

  def create
    # require 'pry'; binding.pry
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link if current_user
          flash[:notice] = "Link successfully created"
#           respond_to do |format|
#             format.html
#             format.js {render layout: false}
#           end
    else
      @check = "display"
      flash[:notice] = Link.find_by(short_url: @default_short_params) ?  "Short Url already exists. Try Again" : "Error generating Link, Try Again"   
    end
  end


  def show
    @link = Link.find_by(short_url: params[:id])

    if @link
      @link.increment_click
      # require 'pry'; binding.pry
      @alex = @link.details.build(location: request.location.data['country_name'], refferer: request.referrer, browser: convert_to_device)
      # require 'pry'; binding.pry
      @link.save
      redirect_to @link.long_url
    else 
      redirect_to root_url, notice: "Link doesnt exist"
    end
  end

  def dashboard

  end

  def details
  if  !current_user
    redirect_to "/login" 
    flash[:notice] = "you have to be signed in"
  end

  @link = Link.find_by(short_url: params[:short_url])
  require 'pry'; binding.pry

  end

  def edit   
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


