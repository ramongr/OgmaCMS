class AddCreatedByUpdatedByToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :created_by, index: true
    add_reference :events, :updated_by, index: true
  end
end
