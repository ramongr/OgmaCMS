class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
