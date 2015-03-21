class FileUpload < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /.*/

  validates :name, presence: true
  validates :description, presence: true
  validates :file, presence: true

  belongs_to :user
end