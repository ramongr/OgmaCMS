class Admin::StaticPagesController < ApplicationController
  before_action :set_admin_static_page, only: [:show, :edit, :update, :destroy]

  # GET /admin/static_pages
  # GET /admin/static_pages.json
  def index
    @admin_static_pages = StaticPage.all
  end

  # GET /admin/static_pages/1
  # GET /admin/static_pages/1.json
  def show
  end

  # GET /admin/static_pages/new
  def new
    @admin_static_page = StaticPage.new
  end

  # GET /admin/static_pages/1/edit
  def edit
  end

  # POST /admin/static_pages
  # POST /admin/static_pages.json
  def create
    user_locale = I18n.locale
    I18n.locale = params[:set_locale]
    @admin_static_page = StaticPage.new(admin_static_page_params)

    respond_to do |format|
      if @admin_static_page.save
        I18n.locale = user_locale
        format.html { redirect_to admin_static_pages_path, notice: 'Static page was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_static_pages_path }
      else
        I18n.locale = user_locale
        format.html { render action: 'new' }
        format.json { render json: @admin_static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/static_pages/1
  # PATCH/PUT /admin/static_pages/1.json
  def update
    user_locale = I18n.locale
    I18n.locale = params[:set_locale]
    respond_to do |format|
      if @admin_static_page.update(admin_static_page_params)
        I18n.locale = user_locale
        format.html { redirect_to admin_static_pages_path, notice: 'Static page was successfully updated.' }
        format.json { head :no_content }
      else
        I18n.locale = user_locale
        format.html { render action: 'edit' }
        format.json { render json: @admin_static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/static_pages/1
  # DELETE /admin/static_pages/1.json
  def destroy
    @admin_static_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_static_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_static_page
      @admin_static_page = StaticPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_static_page_params
      params.require(:static_page).permit(:title, :slug, :body, :set_locale)
    end
end
