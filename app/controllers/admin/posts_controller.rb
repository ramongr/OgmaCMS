class Admin::PostsController < Admin::AdminController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @admin_posts = Post.all
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_post = Post.new
    @attachments = Attachment.all
  end

  # GET /admin/posts/1/edit
  def edit
    @attachments = Attachment.all
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @admin_post = current_user.posts.create(post_params)
    @attachments = Attachment.all

    respond_to do |format|
      if @admin_post.save
        format.html { redirect_to admin_posts_url, notice: 'post was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_posts_url }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @admin_post.update(post_params)
        format.html { redirect_to admin_posts_url, notice: 'post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @admin_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin_post
    @admin_post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(*Post.globalize_attribute_names)
  end
end
