class StartTrainingAdmin < ApplicationMailer
	default :from => 'Training@rubyeffect.com'
	def start_training_email(admin,level,user)
		@admin = admin
		@level = level
        @user = user
		mail( :to => @admin.email,
		:subject => "#{@level.name} is Started.")
    end
end
