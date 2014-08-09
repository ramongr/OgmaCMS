class Event < ActiveRecord::Base
  before_validation :validate_dates
  validates :title, :start_time, presence: true

  private
    def validate_dates
      if self.end_time
        if (self.end_time < self.start_time)
          errors.add(:end_time, 'must be a after the start_time') 
        end
      end
    end
end
