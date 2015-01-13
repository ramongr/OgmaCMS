class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published.page(params[:page]).per_page(2).order('updated_at DESC')
    @posts.each do |p|
      p.content = p.content.truncate(500)
    end
  end

  # Listing unpublished posts
  def unpublished
    @unpublished_posts = Post.unpublished.page(params[:page]).per_page(2).order('updated_at DESC')
    @unpublished_posts.each do |p|
      p.content = p.content.truncate(500)
    end
  end

  # Publishing posts
  def publish
    @post = Post.find(params[:post_id])
    @post.update_attributes(publish: !@post.publish, updated_by: current_user)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @postcomments = Comment.where(post_id: @post.id).order(created_at: :desc)
  end

  def toggle_read
    if params[:more] == 'true'
      @post = Post.find(params[:post_id])
    else
      @post = Post.find(params[:post_id])
      @post.content = @post.content.truncate(500)
    end
  end
end
