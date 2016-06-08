class Submit < ActiveRecord::Base
	belongs_to :test
	mount_uploader :code, CodeUploader
	belongs_to :user
end
        








                                                  