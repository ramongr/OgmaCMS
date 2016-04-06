class AddPublishTagToEvents < ActiveRecord::Migration
  def up
    add_column :events, :publish, :boolean, default: false
  end

  def down
    remove_column :events, :publish
  end
end
