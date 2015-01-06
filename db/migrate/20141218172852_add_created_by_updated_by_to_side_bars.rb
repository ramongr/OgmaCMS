class AddCreatedByUpdatedByToSideBars < ActiveRecord::Migration
  def change
    add_reference :sidebars, :created_by, index: true
    add_reference :sidebars, :updated_by, index: true
  end
end
