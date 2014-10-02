class Event < ActiveRecord::Base
  include ApplicationHelper

  has_many :users, through: :attendings

  before_validation :validate_dates
  validates :title, :start_time, presence: true

  private

  def validate_dates
    if end_time
      if end_time < start_time
        errors.add(:end_time, 'must be a after the start_time')
      end
    end
  end
end
