class LinksController < ApplicationController
  def index
    @link = Link.new
  end


  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link.long_url
      flash[:short_url] = Link.new.generate_short_url
      # flash[:short_url] = domain_name + "/" + @short_url.short_url
    else
      # render :index, notice: "Something Happened"
    end
    redirect_to(:index)
  end

  def show
    link = link.find(params[:short_url])
    if link
      link.increment_click_count
      redirect_to link.long_url
    else 
      redirect_to(:back)
      # notice: "Link doesnt exist"
    end
  end


  def new 
  end

  def edit
  end

  private
  #specifying only trusted parameters from the Internet
    def link_params
      params.require(:link).permit(:long_url, :short_url, :clicks)
    end
end
