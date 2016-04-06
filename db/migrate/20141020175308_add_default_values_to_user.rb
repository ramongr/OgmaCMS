class AddDefaultValuesToUser < ActiveRecord::Migration
  def up
    change_column :users, :role, :string, default: 'registered'
    change_column :users, :newsletter_subscribed, :boolean, default: false
  end
  def down
    change_column :users, :role, :string, default: nil
    change_column :users, :newsletter_subscribed, :boolean, default: nil
  end
end