class AddSubjectToNewsletters < ActiveRecord::Migration
  def up
    add_column :newsletters, :subject, :string
  end

  def down
    remove_column :newsletters, :subject
  end
end
