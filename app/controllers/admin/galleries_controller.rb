class Admin::GalleriesController < Admin::AdminController
  load_and_authorize_resource

  # GET /admin/galleries
  # GET /admin/galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /admin/galleries/1
  # GET /admin/galleries/1.json
  def show
    @added_images = @gallery.photos.order(position: :asc)
  end

  def publish
    @gallery = Gallery.find(params[:gallery_id])
    @gallery.update_attributes(publish: !@gallery.publish)

    respond_to do |format|
      format.js
    end
  end

  # GET /admin/galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /admin/galleries/1/edit
  def edit
    @images = Attachment.images
    @added_images = @gallery.photos.order(position: :asc)
  end

  # POST /admin/galleries/1/add_photo
  def add_photo
    @photo = Photo.new
    @attachment_id = params[:attachment_id]
    @attachment = Attachment.find(@attachment_id)

    @photo.imageable = @gallery
    @photo.attachment = @attachment
    @photo.position = 1

    if @photo.save
      @gallery.update_attributes(updated_by: current_user)
      @added_images = @gallery.photos.order(position: :asc)
      render edit: { id: @photo.id }, status: :ok
    else
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  # POST /admin/galleries/1/remove_photo
  def remove_photo
    @photo = Photo.find(params[:photo_id])
    @photo.destroy
    @gallery.update_attributes(updated_by: current_user)
    redirect_to request.env['HTTP_REFERER']
  end

  # Assuming Photos already created (just updates positions)
  # POST /admin/galleries/1/reorder
  def reorder
    @photo_ids = params[:photos]
    n = 0
    ActiveRecord::Base.transaction do
      @photo_ids.each do |id|
        photo = Photo.find(id)
        photo.position = n
        n += 1
        if photo.save
          @gallery.update_attributes(updated_by: current_user)
        end
      end
    end
    render json: nil, status: :ok
  end

  # POST /admin/galleries
  # POST /admin/galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.created_by = @gallery.updated_by = current_user

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to edit_admin_gallery_path(@gallery), notice: 'Gallery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/galleries/1
  # PATCH/PUT /admin/galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params.merge(updated_by: current_user))
        format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/galleries/1
  # DELETE /admin/galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_galleries_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def gallery_params
    params.require(:gallery).permit(:title, :description, :date)
  end
end
