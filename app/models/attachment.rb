class Attachment < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file
  validates_presence_of :name
  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file
end
