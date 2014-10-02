class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.boolean :selected

      t.timestamps
    end
  end
end
