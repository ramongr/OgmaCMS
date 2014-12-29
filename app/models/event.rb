class Event < ActiveRecord::Base
  has_many :users, through: :attendings
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  before_validation :validate_dates
  validates_presence_of :title, :start_time, :created_by, :updated_by

  include PgSearch
  pg_search_scope :search, against: [:title, :body],
                           using: { tsearch: { prefix: true } },
                           ignoring: :accents

  private

  def validate_dates
    if end_time
      if end_time < start_time
        errors.add(:end_time, I18n.t('events.end_time_after_start_time'))
      end
    end
  end
end
