class CreateVisitorComments < ActiveRecord::Migration
  def change
    create_table :visitor_comments do |t|
      t.string :subject
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
