class AddNewslettersSubscribedToUser < ActiveRecord::Migration
  def up
    add_column :users, :newsletter_subscribed, :boolean
  end

  def down
    remove_column :users, :newsletter_subscribed
  end
end
