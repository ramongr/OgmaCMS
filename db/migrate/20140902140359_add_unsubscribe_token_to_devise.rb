class AddUnsubscribeTokenToDevise < ActiveRecord::Migration
  # Note: You can't use change, as User.update_all with fail in the down migration
  def self.up
    add_column :users, :unsubscribe_token, :string
    add_index :users, :unsubscribe_token, :unique => true
  end

  def self.down
    remove_columns :users, :unsubscribe_token
  end
end
