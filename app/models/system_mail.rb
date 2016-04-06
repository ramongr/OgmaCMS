class SystemMail < ActiveRecord::Base
  translates :name, :subject, :content
  globalize_accessors

  validates :name, :subject, :content, presence: true
  validates :name, uniqueness: true
end
