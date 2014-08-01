class StaticPage < ActiveRecord::Base
  translates :title, :body
  globalize_accessors
  before_validation :set_slug
  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true, format: { with: /\A[a-z_]+\z/ }
  has_and_belongs_to_many :sidebars


  def self.search(search)
    search_condition = "%" + search.downcase + "%"
    where("lower(title) like ? or lower(body) like ? ", search_condition, search_condition)
  end
  
  private
    def set_slug
      if self.slug.blank?
       self.slug = ActiveSupport::Inflector.transliterate(self.title).gsub(/[^a-z_ ]/i, '').downcase.tr(" ","_")
      end
    end
end
