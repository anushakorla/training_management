class Submit < ActiveRecord::Base
	belongs_to :test
	mount_uploader :code, CodeUploader
	belongs_to :user
	before_save :capitalize_title

	def capitalize_title
      self.title = self.title.split.collect(&:capitalize).join(' ') if self.title && !self.title.blank?
    end
end
        








                                                  