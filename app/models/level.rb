class Level < ActiveRecord::Base
	belongs_to :program
	has_many :attachments
	has_many :tests
end
