class LinksController < ApplicationController
  def index
    @link = Link.new
  end


  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link successfully created"
    else
      render :index
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


  def new 
  end

  def edit
  end

  private
  #specifying only trusted parameters from the Internet
    def link_params
      params.require(:link).permit(:long_url, :short_url)
    end
end
