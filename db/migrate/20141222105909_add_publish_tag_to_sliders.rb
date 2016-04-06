class AddPublishTagToSliders < ActiveRecord::Migration
  def up
    add_column :sliders, :publish, :boolean, default: false
  end

  def down
    remove_column :sliders, :publish
  end
end
