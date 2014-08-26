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
  before_save :set_forem_role
  validate :name, presence: true

  ROLES = %w[super_admin admin author registered]

  def forem_name
    email
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) >= ROLES.index(role)
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

    def set_forem_role
      if self.role? :admin
        self.forem_admin = true
      end
    end
end