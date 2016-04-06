class CreatePostsTranslation < ActiveRecord::Migration
  def self.up
    Post.create_translation_table!({
                                     title: :string,
                                     content: :text
                                   }, {
                                     migrate_data: true
                                   })
  end

  def self.down
    Post.drop_translation_table! migrate_data: true
  end
end
