class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @admin_users = User.all
  end

  def show
  end

  def new
    @admin_user = User.new
  end

  def edit
  end

  def create
    @admin_user = User.new(user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: admin_users_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @admin_user.update(user_params)
        sign_in(@admin_user, :bypass => true) if @admin_user == current_user
        format.html { redirect_to admin_users_url, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:password,:password_confirmation, :role)
    end
end