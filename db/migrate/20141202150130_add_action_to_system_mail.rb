class AddActionToSystemMail < ActiveRecord::Migration
  def up
    add_column :system_mails, :action, :string
  end

  def down
    remove_column :system_mails, :action
  end
end
