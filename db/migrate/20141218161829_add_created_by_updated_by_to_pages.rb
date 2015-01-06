class AddCreatedByUpdatedByToPages < ActiveRecord::Migration
  def change
    add_reference :pages, :created_by, index: true
    add_reference :pages, :updated_by, index: true
  end
end
