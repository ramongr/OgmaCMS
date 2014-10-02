class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.page(params[:page]).per_page(2).order('created_at DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @postcomments = Comment.where(post_id: @post.id).order(created_at: :desc)
  end
end
