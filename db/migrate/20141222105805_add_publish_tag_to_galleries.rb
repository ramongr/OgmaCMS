class AddPublishTagToGalleries < ActiveRecord::Migration
  def up
    add_column :galleries, :publish, :boolean, default: false
  end

  def down
    remove_column :galleries, :publish
  end
end
