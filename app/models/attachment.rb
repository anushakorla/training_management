class Attachment < ActiveRecord::Base
	belongs_to :level
	mount_uploader :document, DocumentUploader
end
