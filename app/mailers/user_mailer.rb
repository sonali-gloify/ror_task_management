class UserMailer < ApplicationMailer
    default from: "TMS@gloify.com"
    def welcome_email (user)
        @user = user 
        mail(to: @user.email, subject: "Welcome to TMS")
    end

    def role_changed (user)
        @user = user
        to_manager = User.with_role(:manager).pluck(:email)
        to_lead = User.with_role(:lead).pluck(:email)
        @to_users = to_manager + to_lead
        mail(to: @to_users, subject: "Role Changed")
    end
end
