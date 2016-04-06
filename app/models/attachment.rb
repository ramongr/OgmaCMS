class Attachment < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  has_attached_file :file,
                    path: ':rails_root/uploads/:class/:id/:basename.:extension',
                    url: ':id/download'

  validates_presence_of :name, :created_by, :updated_by
  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file
  
  scope :images, -> { where("lower(file_content_type) LIKE '#{'image'}%'") }
  scope :attachments, -> { where("lower(file_content_type) NOT LIKE '#{'image'}%'") }

  def image?
    file_content_type.start_with? 'image'
  end

  def text?
    file_content_type.start_with? 'text'
  end

  def application?
    file_content_type.start_with? 'application'
  end

  def audio?
    file_content_type.start_with? 'audio'
  end

  def video?
    file_content_type.start_with? 'video'
  end
end
