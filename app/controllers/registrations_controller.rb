class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      UserMailer.with(user: @user).welcome_email.deliver_later
    end
  end
end
