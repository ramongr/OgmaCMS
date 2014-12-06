class AddRegistrationDueDateToUsers < ActiveRecord::Migration
  def up
    add_column :users, :registration_due_date, :date
  end

  def down
    remove_column :users, :registration_due_date
  end
end
