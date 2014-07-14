class Admin::StaticPage < ActiveRecord::Base
  before_validation :set_slug
  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true, format: { with: /\A[a-z_]+\z/ }

  private
    def set_slug
     self.slug = ActiveSupport::Inflector.transliterate(self.title).gsub(/[^a-z_ ]/i, '').downcase.tr(" ","_")
    end
end
