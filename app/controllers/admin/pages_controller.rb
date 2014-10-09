class Admin::PagesController < Admin::AdminController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /admin/Pages
  # GET /admin/Pages.json
  def index
    @admin_pages = Page.all
  end

  # GET /admin/Pages/1
  # GET /admin/Pages/1.json
  def show
  end

  # GET /admin/Pages/new
  def new
    @admin_page = Page.new
    @attachments = Attachment.all
  end

  # GET /admin/Pages/1/edit
  def edit
    @attachments = Attachment.all
  end

  # POST /admin/Pages
  # POST /admin/Pages.json
  def create
    @admin_page = Page.new(page_params)
    @attachments = Attachment.all

    respond_to do |format|
      if @admin_page.save
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_pages_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/Pages/1
  # PATCH/PUT /admin/Pages/1.json
  def update
    respond_to do |format|
      if @admin_page.update(page_params)
        format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/Pages/1
  # DELETE /admin/Pages/1.json
  def destroy
    @admin_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin_page
    @admin_page = Page.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    permitted = Page.globalize_attribute_names + [:slug]
    params.require(:page).permit(*permitted)
  end
end
