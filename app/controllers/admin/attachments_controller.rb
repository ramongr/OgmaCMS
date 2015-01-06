class Admin::AttachmentsController < Admin::AdminController
  load_and_authorize_resource

  # GET /admin/attachments
  # GET /admin/attachments.json
  def index
    @attachments = Attachment.all
  end

  # GET /admin/attachments/1
  # GET /admin/attachments/1.json
  def show
  end

  # GET /admin/attachments/new
  def new
    @attachment = Attachment.new
  end

  # GET /admin/attachments/1/edit
  def edit
  end

  # GET /admin/attachments/1/download
  def download
    @attachment = Attachment.find(params[:id])
    send_file @attachment.file.path, type: @attachment.file_content_type, disposition: 'inline'
  end

  # POST /admin/attachments
  # POST /admin/attachments.json
  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.created_by = @attachment.updated_by = current_user

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to admin_attachments_url, notice: 'Attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/attachments/1
  # PATCH/PUT /admin/attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params.merge(updated_by: current_user))
        format.html { redirect_to admin_attachments_url, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/attachments/1
  # DELETE /admin/attachments/1.json
  def destroy
    # Check if attachment is part of other objects before deleting.
    Photo.where(attachment: @attachment).destroy_all

    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to admin_attachments_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def attachment_params
    params.require(:attachment).permit(:name, :description, :file)
  end
end
