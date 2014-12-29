class AddCreatedByUpdatedByToNewsletters < ActiveRecord::Migration
  def change
    add_reference :newsletters, :created_by, index: true
    add_reference :newsletters, :updated_by, index: true
  end
end
