class AttachmentsController < ApplicationController

  # GET /admin/attachments/1/download
  def download
    @attachment = Attachment.find(params[:id])
    send_file @attachment.file.path, :type => @attachment.file_content_type, :disposition => 'inline'
  end

end