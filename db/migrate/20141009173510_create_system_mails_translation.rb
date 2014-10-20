class CreateSystemMailsTranslation < ActiveRecord::Migration
  def self.up
    SystemMail.create_translation_table!({
                                           name: :string,
                                           subject: :string,
                                           content: :text
                                         }, {
                                           migrate_data: true
                                         })
  end

  def self.down
    SystemMail.drop_translation_table! migrate_data: true
  end
end
