class Admin::PagesController < Admin::AdminController
  load_and_authorize_resource

  # GET /admin/Pages
  # GET /admin/Pages.json
  def index
    @pages = Page.all
  end

  # GET /admin/Pages/1
  # GET /admin/Pages/1.json
  def show
  end

  def publish
    @page = Page.find(params[:page_id])
    @page.update_attributes(publish: !@page.publish)

    respond_to do |format|
      format.js
    end
  end

  # GET /admin/Pages/new
  def new
    @page = Page.new
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

  # GET /admin/Pages/1/edit
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

  # POST /admin/Pages
  # POST /admin/Pages.json
  def create
    @page = Page.new(page_params)
    @page.created_by = @page.updated_by = current_user
    @attachments = Attachment.all

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_pages_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/Pages/1
  # PATCH/PUT /admin/Pages/1.json
  def update
    if params[:ajax]
      # Update HERE from AJAX
      @page.update_attributes("#{params[:post][:lang]}".to_sym => params[:post][:body], updated_by: current_user)
      @page.save!

      respond_to do |format|
        format.json {render action: 'show'}
      end
    else
      respond_to do |format|
        if @page.update(page_params.merge(updated_by: current_user))
          format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render action: 'edit' }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /admin/Pages/1
  # DELETE /admin/Pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    permitted = Page.globalize_attribute_names + [:slug]
    params.require(:page).permit(*permitted)
  end
end
