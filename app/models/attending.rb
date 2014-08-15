class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates_presence_of :user, :event, :going
  scope :yes, -> { where("going LIKE 'yes'") }
  scope :no, -> { where("going LIKE 'no'") }
  scope :maybe, -> { where("going LIKE 'maybe'") }

  def yes?
    self.going == 'yes'
  end

  def no?
    self.going == 'no'
  end

  def maybe?
    self.going == 'maybe'
  end

end