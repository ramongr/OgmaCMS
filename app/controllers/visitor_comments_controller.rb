class VisitorCommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_visitor_comment, only: [:show, :edit, :update, :destroy]

  # GET /visitor_comments
  # GET /visitor_comments.json
  def index
    @visitor_comments = VisitorComment.page(params[:page]).per_page(5).order('created_at DESC')
  end

  # GET /visitor_comments/1
  # GET /visitor_comments/1.json
  def show
  end

  # GET /visitor_comments/new
  def new
    @visitor_comment = VisitorComment.new
  end

  # GET /visitor_comments/1/edit
  def edit
  end

  # POST /visitor_comments
  # POST /visitor_comments.json
  def create
    @visitor_comment = current_user.visitor_comments.create(visitor_comment_params)

    respond_to do |format|
      if @visitor_comment.save
        format.html { redirect_to @visitor_comment, notice: 'Visitor comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @visitor_comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @visitor_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visitor_comments/1
  # PATCH/PUT /visitor_comments/1.json
  def update
    respond_to do |format|
      if @visitor_comment.update(visitor_comment_params)
        format.html { redirect_to @visitor_comment, notice: 'Visitor comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @visitor_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitor_comments/1
  # DELETE /visitor_comments/1.json
  def destroy
    @visitor_comment.destroy
    respond_to do |format|
      format.html { redirect_to visitor_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_comment
      @visitor_comment = VisitorComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visitor_comment_params
      params.require(:visitor_comment).permit(:subject, :name, :email, :content)
    end
end
