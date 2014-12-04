class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.all
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @post = Post.new
    attachments = Attachment.all
    @image_attachments = attachments.select do |s|
      s.image? == true
    end
    @audio_attachments = attachments.select do |s|
      s.audio? == true
    end
    @video_attachments = attachments.select do |s|
      s.video? == true
    end
    @text_attachments = attachments.select do |s|
      s.text? == true
    end
    @application_attachments = attachments.select do |s|
      s.application? == true
    end
  end

  # GET /admin/posts/1/edit
  def edit
    attachments = Attachment.all
    @image_attachments = attachments.select do |s|
      s.image? == true
    end
    @audio_attachments = attachments.select do |s|
      s.audio? == true
    end
    @video_attachments = attachments.select do |s|
      s.video? == true
    end
    @text_attachments = attachments.select do |s|
      s.text? == true
    end
    @application_attachments = attachments.select do |s|
      s.application? == true
    end
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = current_user.posts.create(post_params)
    @attachments = Attachment.all

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_url, notice: 'post was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_posts_url }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_posts_url, notice: 'post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(*Post.globalize_attribute_names)
  end
end
