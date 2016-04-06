class AddTypemaskToLinks < ActiveRecord::Migration
  def change
    add_column :links, :type_mask, :integer
  end
end
