class UserEmail < ApplicationMailer
    def signup_notify(to,subject,message)
        
        mail(to:to,subject:subject,message:message)
    end
end
