class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :value

      t.timestamps
    end
  end
end
