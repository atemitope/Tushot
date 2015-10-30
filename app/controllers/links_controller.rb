class LinksController < ApplicationController


  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link.long_url
      flash[:short_url] = domain_name + "/" + @short_url.short_url
    else
      render "new", notice: "Something Happened"
    end

  end


  def show
    link = link.find(params[:short_url])
    if link
      link.increment_click_count
      redirect_to link.long_url
    else 
      redirect_back, notice: "Link doesnt exist"
    end
  end


  private
  #specifying only trusted parameters from the Internet
    def link_params
      params.require(:link).permit(:long_url, :short_url, :clicks)
    end
end
