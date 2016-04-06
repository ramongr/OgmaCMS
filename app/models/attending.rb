class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates_presence_of :user, :event, :going
  scope :yes, -> { where("going LIKE 'yes'") }
  scope :no, -> { where("going LIKE 'no'") }
  scope :maybe, -> { where("going LIKE 'maybe'") }

  def yes?
    going == 'yes'
  end

  def no?
    going == 'no'
  end

  def maybe?
    going == 'maybe'
  end
end
