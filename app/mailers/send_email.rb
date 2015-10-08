class SendEmail < ApplicationMailer
	def signup_notify(mail,subject,message)
		mail(to:mail,subject:subject,message:message)
	end
	def send_notification(email,name)
		@email=email
		@name=name
		mail(to:@email,subject:"SignUp Notification")
	end
end
