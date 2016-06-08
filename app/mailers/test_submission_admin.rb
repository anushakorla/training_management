class TestSubmissionAdmin < ApplicationMailer
	default :from => 'Training@rubyeffect.com'
	def submission_email(admin,submit,user)
		@admin = admin
		@submit = submit
		@user = user
		mail( :to => @admin.email,
		:subject => "submittinge Test.")
    end
end
