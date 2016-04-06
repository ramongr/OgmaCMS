class AddPublishTagToPages < ActiveRecord::Migration
  def up
    add_column :pages, :publish, :boolean, default: false
  end

  def down
    remove_column :pages, :publish
  end
end
