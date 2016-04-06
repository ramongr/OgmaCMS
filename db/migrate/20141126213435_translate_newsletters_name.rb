class TranslateNewslettersName < ActiveRecord::Migration
  def up
    Newsletter.add_translation_fields! name: :string
  end

  def down
    remove_column :newsletter_translations, :name
  end
end
