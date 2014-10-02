class StaticPagesController < ApplicationController
  # GET /pages
  def index
    @pages = StaticPage.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = StaticPage.find(params[:id])
  end
end
