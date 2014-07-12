class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :verify_admin

  layout "admin"

  private
  def verify_admin
    redirect_to root_url, notice: 'Not autorized' unless current_user.try(:admin?)
  end
end
