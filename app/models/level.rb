class Level < ActiveRecord::Base
	belongs_to :program
	has_many :attachments
	has_many :tests
	before_save :capitalize_name
	validates_numericality_of :duration, :allow_nil => true

	def capitalize_name
      self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
    end
end
