class CreateSidebarsStaticPages < ActiveRecord::Migration
  def change
    create_table :sidebars_static_pages do |t|
      t.integer :sidebar_id
      t.integer :static_page_id
    end
  end
end
