class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin
  before_action :set_username_cookie, only: [:new, :edit]

  layout "admin"

  private
  def verify_admin
    redirect_to root_url, notice: 'Not authorized' unless current_user.role? :admin
  end

  def set_username_cookie
    if(current_user)
      cookies[:user_name] = current_user.email
    end
  end
end
