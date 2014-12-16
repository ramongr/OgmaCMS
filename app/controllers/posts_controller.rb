class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.published.page(params[:page]).per_page(2).order('created_at DESC')
    @posts.each do |p|
      p.content = p.content.truncate(500)
    end
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
      p "Here"
      @post = Post.find(params[:post_id])
      @post.content = @post.content.truncate(500)
    end
  end
end
