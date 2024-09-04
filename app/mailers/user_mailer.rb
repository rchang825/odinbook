class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  default from: 'notifications@odinbook.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Odinbook')
  end
end
