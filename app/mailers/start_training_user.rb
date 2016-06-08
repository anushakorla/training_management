class StartTrainingUser < ApplicationMailer
	default :from => 'Training@rubyeffect.com'
	def start_training_email(user,level)
		@user = user
		@level = level
		mail( :to => @user.email,
		:subject => "'#{@level.name}' is Started.")
    end
end
