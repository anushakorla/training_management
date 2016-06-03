class Level < ActiveRecord::Base
	belongs_to :program
	has_many :attachments
end
