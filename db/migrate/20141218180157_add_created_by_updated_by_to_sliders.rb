class AddCreatedByUpdatedByToSliders < ActiveRecord::Migration
  def change
    add_reference :sliders, :created_by, index: true
    add_reference :sliders, :updated_by, index: true
  end
end
