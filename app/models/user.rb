class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  has_many :visitor_comments
  has_many :attachments
  has_many :events, through: :attendings
  has_many :events_created, class_name: 'Event', foreign_key: 'created_by_id'
  has_many :events_modified, class_name: 'Event', foreign_key: 'updated_by_id'
  has_and_belongs_to_many :newsletters

  ROLES = %w(registered author admin super_admin)

  before_validation :set_language
  before_validation :set_time_zone
  before_validation :set_registration_due_date
  before_save :set_forem_role
  validate :name, :role, presence: true
  validate :name, length: { in: 2..69 }
  validates_inclusion_of :role, in: ROLES
  validates_inclusion_of :language, in: Setting.selected_languages
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name).keys

  scope :birthdays, -> { where.not(dob: nil) }
  scope :unconfirmed, -> { where(confirmed_at: nil)}

  def forem_name
    email
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def super_admin?
    role == 'super_admin'
  end

  def admin?
    role == 'admin'
  end

  def author?
    role == 'author'
  end

  def registered?
    role == 'registered'
  end

  def translated_role
    I18n.t('users.roles.' + role)
  end

  private

  def set_language
    if language.blank?
      self.language = I18n.locale.to_s
    end
  end

  def set_time_zone
    if time_zone.blank?
      self.time_zone = Setting.default_time_zone
    end
  end

  def set_forem_role
    if self.role? :admin
      self.forem_admin = true
    end
  end

  def add_unsubscribe_token
    begin
      self.unsubscribe_token = SecureRandom.hex[0, 10].upcase
    end while self.class.exists?(unsubscribe_token: unsubscribe_token)
  end

  def set_registration_due_date
    self.registration_due_date = 5.days.from_now
  end

  def self.remove_user
    @user = User.unconfirmed
    t = Time.now.to_date
    @user.each do |u|
      if u.registration_due_date < t
        u.destroy
      end
    end
  end

  def self.birthday_email
    @user = User.birthdays
    t = Time.now.to_date
    @user.each do |u|
      if u.dob.day == t.day && u.dob.month ==  t.month
        SystemMailer.birthday_email(u).deliver
      end
    end
  end
end
