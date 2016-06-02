class Level < ActiveRecord::Base
	belongs_to :program
	mount_uploader :attachment, AttachmentUploader
end
