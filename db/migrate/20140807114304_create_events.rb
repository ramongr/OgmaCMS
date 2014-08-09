class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
