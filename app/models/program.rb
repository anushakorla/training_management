class Program < ActiveRecord::Base
	belongs_to :user
	has_many :levels
    before_save :capitalize_language
     before_save :capitalize_description


	def capitalize_language
      self.language = self.language.split.collect(&:capitalize).join(' ') if self.language && !self.language.blank?
    end

	def capitalize_description
      self.description = self.description.split.collect(&:capitalize).join(' ') if self.description && !self.description.blank?
    end
end
