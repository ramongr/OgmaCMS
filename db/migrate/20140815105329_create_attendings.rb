class CreateAttendings < ActiveRecord::Migration
  def up
    create_table :attendings do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.string :going

      t.timestamps
    end
  end

  def down
    drop_table :attendings
  end
end
