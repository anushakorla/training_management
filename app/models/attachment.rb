class Attachment < ActiveRecord::Base
	belongs_to :level
	mount_uploader :document, DocumentUploader
	 before_save :capitalize_name

	def capitalize_name
      self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
    end
end
