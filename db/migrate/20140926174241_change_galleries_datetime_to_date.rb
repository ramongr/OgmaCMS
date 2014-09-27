class ChangeGalleriesDatetimeToDate < ActiveRecord::Migration
  def up
    change_column :galleries, :date, :date
  end

  def down
    change_column :galleries, :date, :datetime
  end
end