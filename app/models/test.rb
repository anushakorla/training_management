class Test < ActiveRecord::Base
	belongs_to :level
	has_many :submits
	validates :description , presence: true
end
