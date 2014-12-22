class Admin::NewslettersController < Admin::AdminController
  load_and_authorize_resource

  def index
    @newsletters = Newsletter.all
  end

  # GET /admin/newsletters/1
  def show
  end

  # GET /admin/newsletters/new
  def new
    @newsletter = Newsletter.new
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

  # GET /admin/newsletters/1/edit
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

  # GET /admin/newsletters/1/send_newsletter
  def send_newsletter
    @newsletter = Newsletter.find(params[:id])
    @newsletter.users.each do |user|
      SystemMailer.newsletter_send(@newsletter, user).deliver
    end

    respond_to do |format|
      format.js
    end
  end

  # POST /admin/newsletters
  # POST /admin/newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.created_by = @newsletter.updated_by = current_user

    params[:newsletter][:user_ids] ||= []
    @newsletter.user_ids = params[:newsletter][:user_ids]

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to [:admin, @newsletter], notice: 'Newsletter was successfully created.' }
        format.json { render action: 'show', status: :created, location: newsletters_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/newsletters/1
  # PATCH/PUT /admin/newsletters/1.json
  def update
    params[:newsletter][:user_ids] ||= []
    @newsletter.user_ids = params[:newsletter][:user_ids]

    respond_to do |format|
      if @newsletter.update(newsletter_params.merge(updated_by: current_user))
        format.html { redirect_to [:admin, @newsletter], notice: 'Newsletter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/newsletters/1
  # DELETE /admin/newsletters/1.json
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to admin_newsletters_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_params
    params.require(:newsletter).permit(*Newsletter.globalize_attribute_names)
  end
end
