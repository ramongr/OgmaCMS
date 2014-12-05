class RemoveAllDayFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :all_day
  end
end
