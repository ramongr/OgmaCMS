class SearchController < ApplicationController
  def index
    if params[:search]
      @pages = Page.search params[:search]
      @posts = Post.search params[:search]
    else
      @pages = Page.all
      @posts = Post.all
    end
  end
end
