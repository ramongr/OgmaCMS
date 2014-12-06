class Post < ActiveRecord::Base
  translates :title, :content
  globalize_accessors
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :content, :user, presence: true

  scope :published, -> { where(publish: true)}

  include PgSearch
  pg_search_scope :search, against: [:title, :content],
                           using: { tsearch: { prefix: true } },
                           associated_against: { user: :name, comments: :content },
                           ignoring: :accents
end
