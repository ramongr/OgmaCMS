class Attachment < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file,
    :path => ":rails_root/uploads/:class/:id/:basename.:extension",
    :url => ":id/download"
  validates_presence_of :name, :user
  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file
  scope :images, -> { where("lower(file_content_type) LIKE '#{"image"}%'") }
  scope :attachments, -> { where("lower(file_content_type) NOT LIKE '#{"image"}%'") }

end
