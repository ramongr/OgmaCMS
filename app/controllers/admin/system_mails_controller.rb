class Admin::SystemMailsController < ApplicationController
  before_action :set_system_mail, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  load_and_authorize_resource

  def index
    @system_mails = SystemMail.all
    respond_with(@system_mails)
  end

  def show
    respond_with(@system_mail)
  end

  def new
    @system_mail = SystemMail.new
    respond_with(@system_mail)
  end

  def edit
  end

  def create
    @system_mail = SystemMail.new(system_mail_params)
    flash[:notice] = 'SystemMail was successfully created.' if @system_mail.save
    respond_with(@system_mail)
  end

  def update
    flash[:notice] = 'SystemMail was successfully updated.' if @system_mail.update(system_mail_params)
    respond_with(@system_mail)
  end

  def destroy
    @system_mail.destroy
    respond_with(@system_mail)
  end

  private
    def set_system_mail
      @system_mail = SystemMail.find(params[:id])
    end

    def system_mail_params
      params.require(:system_mail).permit(*SystemMail.globalize_attribute_names)
    end
end
