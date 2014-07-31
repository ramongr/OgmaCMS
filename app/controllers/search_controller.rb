class SearchController < ApplicationController

  def index
  	if params[:search]
      @static_pages = StaticPage.search params[:search]
      @blogs = Blog.search params[:search]
    else
      @static_pages = StaticPage.all
      @blogs = Blog.all
    end
  end
  
end
