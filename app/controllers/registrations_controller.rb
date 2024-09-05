class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      UserMailer.with(user: @user).welcome_email.deliver_later
    end
    Follow.create!(follower_id: @user.id, followee_id: @user.id, approved: true)
  end
end
