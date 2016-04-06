class RenameUserToCreatedByInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :created_by_id
  end
end
