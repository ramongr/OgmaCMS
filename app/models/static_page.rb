class StaticPage < ActiveRecord::Base
  translates :title, :body
  globalize_accessors
  before_validation :set_slug
  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true, format: { with: /\A[a-z_]+\z/ }
  has_and_belongs_to_many :sidebars

  include PgSearch
  pg_search_scope :search, against: [:title, :body],
                           using: { tsearch: { prefix: true } },
                           ignoring: :accents

  private

  def set_slug
    if slug.blank?
      self.slug = ActiveSupport::Inflector.transliterate(title).gsub(/[^a-z_ ]/i, '').downcase.tr(' ', '_')
    end
  end
end
