class AddPublishTagToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :publish, :boolean, default: false
  end

  def down
    remove_column :posts, :publish
  end
end
