class Admin::SlidersController < Admin::AdminController
  load_and_authorize_resource

  # GET /admin/sliders
  # GET /admin/sliders.json
  def index
    @sliders = Slider.all
  end

  # GET /admin/sliders/1
  # GET /admin/sliders/1.json
  def show
    @added_images = @slider.photos.order(position: :asc)
  end

  # GET /admin/sliders/new
  def new
    @slider = Slider.new
  end

  # GET /admin/sliders/1/edit
  def edit
    @images = Attachment.images
    @added_images = @slider.photos.order(position: :asc)
  end

  # POST /admin/sliders/1/add_photo
  def add_photo
    @photo = Photo.new

    @attachment_id = params[:attachment_id]
    @attachment = Attachment.find(@attachment_id)

    @photo.imageable = @slider
    @photo.attachment = @attachment
    @photo.position = 1

    if @photo.save
      @gallery.update_attributes(updated_by: current_user)
      @added_images = @slider.photos.order(position: :asc)
      render edit: { id: @photo.id }, status: :ok
    else
      format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  # POST /admin/sliders/1/remove_photo
  def remove_photo
    @photo = Photo.find(params[:photo_id])
    @photo.destroy
    @gallery.update_attributes(updated_by: current_user)
    render json: nil, status: :ok
  end

  # Assuming Photos already created (just updates positions)
  # POST /admin/sliders/1/reorder
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

  # POST /admin/sliders
  # POST /admin/sliders.json
  def create
    @slider = Slider.new(slider_params)
    @slider.created_by = @slider.updated_by = current_user
    selection_handler(params[:slider][:selected])

    respond_to do |format|
      if @slider.save
        format.html { redirect_to edit_admin_slider_path(@slider), notice: 'Slider was successfully created.' }
        format.json { render action: 'show', status: :created, location: @slider }
      else
        format.html { render action: 'new' }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sliders/1
  # PATCH/PUT /admin/sliders/1.json
  def update
    selection_handler(params[:slider][:selected])

    respond_to do |format|
      if @slider.update(slider_params.merge(updated_by: current_user))
        format.html { redirect_to admin_sliders_url, notice: 'Slider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sliders/1
  # DELETE /admin/sliders/1.json
  def destroy
    @slider.destroy
    respond_to do |format|
      format.html { redirect_to admin_sliders_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def slider_params
    params.require(:slider).permit(:title, :selected)
  end

  # Verify the selected param and unselect the old slider if needed.
  def selection_handler(selected)
    if (selected == '1')
      previous_selected = Slider.selected
      if previous_selected
        previous_selected.update(selected: false)
      end
    end
  end
end
