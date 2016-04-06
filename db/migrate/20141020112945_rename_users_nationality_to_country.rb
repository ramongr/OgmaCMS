class RenameUsersNationalityToCountry < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :nationality, :country
    end
  end
end
