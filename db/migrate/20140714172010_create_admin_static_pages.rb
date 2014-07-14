class CreateAdminStaticPages < ActiveRecord::Migration
  def change
    create_table :admin_static_pages do |t|
      t.string :title
      t.string :slug
      t.text :body

      t.timestamps
    end
  end
end
