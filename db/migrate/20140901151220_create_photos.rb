class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :imageable, polymorphic: true, index: true
      t.references :attachment, index: true
      t.integer :position

      t.timestamps
    end
  end
end
