class Test < ActiveRecord::Base
	belongs_to :level
	has_many :submits
	validates :description , presence: true
    before_save :capitalize_title
    before_save :capitalize_description



	def capitalize_title
      self.title = self.title.split.collect(&:capitalize).join(' ') if self.title && !self.title.blank?
    end

    def capitalize_description
      self.description = self.description.split.collect(&:capitalize).join(' ') if self.description && !self.description.blank?
    end
end
