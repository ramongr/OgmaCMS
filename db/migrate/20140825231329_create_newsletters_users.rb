class CreateNewslettersUsers < ActiveRecord::Migration
  def change
    create_table :newsletters_users do |t|
      t.integer :newsletter_id
      t.integer :user_id
    end
  end
end
