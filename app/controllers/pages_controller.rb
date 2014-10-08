class PagesController < ApplicationController
  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
  end
end
