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
  
  before_validation :set_default_role
  before_validation :set_language
  before_save :set_forem_role
  validate :name, :role, presence: true

  ROLES = %w[registered author admin super_admin]

  def forem_name
    email
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def super_admin?
    self.role == 'super_admin'
  end

  def admin?
    self.role == 'admin'
  end

  def author?
    self.role == 'author'
  end

  def registered?
    self.role == 'registered'
  end

  private
    def set_default_role
      if self.role.blank?
        self.role = 'registered'
      end
    end

    def set_language
      if self.language.blank?
        self.language = I18n.locale.to_s
      end
    end

    def set_forem_role
      if self.role? :admin
        self.forem_admin = true
      end
    end

    def set_newsletter_subscribed
      self.newsletter_subscribed = true
    end

    def add_unsubscribe_token
      begin
        self.unsubscribe_token = SecureRandom.hex[0,10].upcase
      end while self.class.exists?(unsubscribe_token: unsubscribe_token)
    end
end