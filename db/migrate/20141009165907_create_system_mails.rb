class CreateSystemMails < ActiveRecord::Migration
  def change
    create_table :system_mails do |t|
      t.string :name
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
