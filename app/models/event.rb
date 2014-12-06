class Event < ActiveRecord::Base
  has_many :users, through: :attendings

  before_validation :validate_dates
  validates :title, :start_time, presence: true

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
