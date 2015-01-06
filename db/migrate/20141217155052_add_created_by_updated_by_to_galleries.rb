class AddCreatedByUpdatedByToGalleries < ActiveRecord::Migration
  def change
    add_reference :galleries, :created_by, index: true
    add_reference :galleries, :updated_by, index: true
  end
end
