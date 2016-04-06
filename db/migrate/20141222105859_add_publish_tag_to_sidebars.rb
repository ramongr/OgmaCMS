class AddPublishTagToSidebars < ActiveRecord::Migration
  def up
    add_column :sidebars, :publish, :boolean, default: false
  end

  def down
    remove_column :sidebars, :publish
  end
end
