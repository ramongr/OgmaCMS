class CreateLinksSidebars < ActiveRecord::Migration
  def change
    create_table :links_sidebars do |t|
      t.integer :link_id
      t.integer :sidebar_id
    end
  end
end
