class RenameNewslettersTitleToName < ActiveRecord::Migration
  def change
    change_table :newsletters do |t|
      t.rename :title, :name
    end
  end
end
