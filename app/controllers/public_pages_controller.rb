class PublicPagesController < ApplicationController

  # GET /admin/static_pages/1
  # GET /admin/static_pages/1.json
  def show
  	@public_page = StaticPage.find(params[:id])
  end

end
