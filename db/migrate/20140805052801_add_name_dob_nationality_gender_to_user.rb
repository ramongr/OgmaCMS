class AddNameDobNationalityGenderToUser < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :nationality, :string
    add_column :users, :gender, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :dob
    remove_column :users, :nationality
    remove_column :users, :gender
  end
end
