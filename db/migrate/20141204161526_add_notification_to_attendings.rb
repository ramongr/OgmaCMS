class AddNotificationToAttendings < ActiveRecord::Migration
  def up
    add_column :attendings, :notification, :boolean, default: true
  end
  def down
    remove_column :attendings, :notification
  end
end
