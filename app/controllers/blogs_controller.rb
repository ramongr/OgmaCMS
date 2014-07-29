class BlogsController < ApplicationController

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.page(params[:page]).per_page(2).order('created_at DESC')
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  	@blog = Blog.find(params[:id])
  end
end