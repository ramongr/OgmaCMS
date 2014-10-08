class CreatePagesSidebars < ActiveRecord::Migration
  def change
    create_table :pages_sidebars do |t|
      t.integer :sidebar_id
      t.integer :page_id
    end
  end
end
