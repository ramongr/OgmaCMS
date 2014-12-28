class AddCreatedByUpdatedByToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :user_id, :created_by_id
    add_reference :posts, :updated_by, index: true
  end
end
