class CreateNewslettersTranslation < ActiveRecord::Migration
  def self.up
    Newsletter.create_translation_table!({
                                           subject: :string,
                                           body: :text
                                         }, {
                                           migrate_data: true
                                         })
  end

  def self.down
    Newsletter.drop_translation_table! migrate_data: true
  end
end
