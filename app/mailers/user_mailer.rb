class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email
      @user = params[:user]
      @url  = 'https://innovalabs.tech/login'
      mail(to: @user.email, subject: 'Welcome to Innova Labs')
    end
end
