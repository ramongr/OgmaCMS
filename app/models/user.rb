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
  has_and_belongs_to_many :newsletters

  before_validation :set_language
  before_save :set_forem_role
  validate :name, :role, presence: true
  validate :name, length: { in: 3..100 }

  ROLES = %w(registered author admin super_admin)

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
end
