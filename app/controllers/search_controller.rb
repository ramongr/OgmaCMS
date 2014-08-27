class SearchController < ApplicationController

  def index
  	if params[:search]
      @static_pages = StaticPage.search params[:search]
      @posts = Post.search params[:search]
    else
      @static_pages = StaticPage.all
      @posts = Post.all
    end
  end
end
