class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_validation :set_default_role
  has_many :posts
  has_many :comments

  ROLES = %w[super_admin admin author registered]

  def forem_name
    email
  end

  private
    def set_default_role
      if self.role.blank?
        self.role = ["registered"]
      end
    end
end
