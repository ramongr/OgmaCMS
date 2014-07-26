class CreateBlogsTranslation < ActiveRecord::Migration
  def self.up
    Blog.create_translation_table!({
      :title => :string,
      :content => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    blogs.drop_translation_table! :migrate_data => true
  end
end