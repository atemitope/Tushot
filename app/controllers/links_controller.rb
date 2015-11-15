class LinksController < ApplicationController

  before_action :authorize_user_for_short_url,:check_default, only: [:create] 

  def index
    @link = Link.new
    @most_recent_links = Link.all.most_recent_links.limit(4)
    @most_popular_links = Link.all.most_popular_links.limit(4)
    @count = Link.all.count
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      current_user.links << @link if current_user
          flash[:notice] = "Link successfully created"
          respond_to do |format|
            # format.html
            format.js {render layout: false}
          end
    else
      @check = "display"
      flash[:notice] = Link.find_by(short_url: @default_short_params) ?  "Short Url already exists. Try Again" : "Error generating Link, Try Again"
      
    end
  end


  def show
    @link = Link.find_by(short_url: params[:id])

    if @link
      @link.clicks += 1
      @link.save
      redirect_to @link.long_url
    else 
      redirect_to root_url, notice: "Link doesnt exist"
    end
  end

  def dashboard

  end

  def new 
  end

  def edit   
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


