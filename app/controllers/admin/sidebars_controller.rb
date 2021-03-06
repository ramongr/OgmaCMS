class Admin::SidebarsController < Admin::AdminController
  load_and_authorize_resource

  # GET /sidebars
  # GET /sidebars.json
  def index
    @sidebars = Sidebar.all
  end

  def show
  end

  # GET /sidebar2s/new
  def new
    @sidebar = Sidebar.new
  end

  def publish
    @sidebar = Sidebar.find(params[:sidebar_id])
    @sidebar.update_attributes(publish: !@sidebar.publish)

    respond_to do |format|
      format.js
    end
  end

  # GET /sidebar2s/1/edit
  def edit
  end

  # POST /sidebar2s
  # POST /sidebar2s.json
  def create
    @sidebar = Sidebar.new(sidebar_params)
    @sidebar.created_by = @sidebar.updated_by = current_user

    params[:sidebar][:link_ids] ||= []
    params[:sidebar][:page_ids] ||= []

    @sidebar.link_ids = params[:sidebar][:link_ids]
    @sidebar.page_ids = params[:sidebar][:page_ids]

    respond_to do |format|
      if @sidebar.save
        format.html { redirect_to [:admin, @sidebar], notice: 'Sidebar was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sidebar }
      else
        format.html { render action: 'new' }
        format.json { render json: @sidebar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sidebars/1
  # PATCH/PUT /sidebars/1.json
  def update
    params[:sidebar][:link_ids] ||= []
    params[:sidebar][:page_ids] ||= []

    @sidebar.link_ids = params[:sidebar][:link_ids]
    @sidebar.page_ids = params[:sidebar][:page_ids]

    respond_to do |format|
      if @sidebar.update(sidebar_params.merge(updated_by: current_user))
        format.html { redirect_to [:admin, @sidebar], notice: 'Sidebar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sidebar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sidebars/1
  # DELETE /sidebars/1.json
  def destroy
    @sidebar.destroy
    respond_to do |format|
      format.html { redirect_to admin_sidebars_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def sidebar_params
    params.require(:sidebar).permit(:title, :type_mask)
  end
end
