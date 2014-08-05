class CreateVisitorComments < ActiveRecord::Migration
  def change
    create_table :visitor_comments do |t|
      t.string :subject
      t.string :name
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
