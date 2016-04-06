class AddCreatedByUpdatedByToVisitorComments < ActiveRecord::Migration
  def change
    rename_column :visitor_comments, :user_id, :created_by_id
  end
end
