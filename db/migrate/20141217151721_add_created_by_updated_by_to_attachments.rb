class AddCreatedByUpdatedByToAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :user_id
    add_reference :attachments, :created_by, index: true
    add_reference :attachments, :updated_by, index: true
  end
end
