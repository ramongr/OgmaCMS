class PublicBlogsController < ApplicationController

  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @public_blogs = Blog.page(params[:page]).per_page(2).order('created_at DESC')
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show
  	@public_blog = Blog.find(params[:id])
  end
end