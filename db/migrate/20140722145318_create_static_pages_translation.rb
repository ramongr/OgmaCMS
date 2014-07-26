class CreateStaticPagesTranslation < ActiveRecord::Migration
  def self.up
    StaticPage.create_translation_table!({
      :title => :string,
      :body => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    static_pages.drop_translation_table! :migrate_data => true
  end
end