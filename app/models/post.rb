class Post < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search, against: [:title, :content],
                           using: { tsearch: { prefix: true } },
                           associated_against: { user: :name, comments: :content },
                           ignoring: :accents
                           
  translates :title, :content
  globalize_accessors

  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :content, :created_by, :updated_by

  scope :published, -> { where(publish: true)}
end
