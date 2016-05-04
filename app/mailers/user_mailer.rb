class UserMailer < ActionMailer::Base
		default :from => "noreply@WWYDH.com"

		def registration_confirmation(user)
			@user = user
			mail(:to => "#{user.username} <#{user.email}>", :subject => "Please confirm your registration")
		end
	end
