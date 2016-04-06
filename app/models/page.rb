class Page < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search, against: [:title, :body],
                           using: { tsearch: { prefix: true } },
                           ignoring: :accents

  translates :title, :body
  globalize_accessors

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'  
  has_and_belongs_to_many :sidebars

  before_validation :set_slug
  validates_presence_of :title, :slug, :body, :created_by, :updated_by
  validates :slug, uniqueness: true, format: { with: /\A[a-z_]+\z/ }

  scope :published, -> { where(publish: true) }

  private

  def set_slug
    if slug.blank?
      self.slug = ActiveSupport::Inflector.transliterate(title).gsub(/[^a-z_ ]/i, '').downcase.tr(' ', '_')
    end
  end
end
