class CreateSidebars < ActiveRecord::Migration
  def change
    create_table :sidebars do |t|
      t.string :title
      t.integer :type_mask

      t.timestamps
    end
  end
end
