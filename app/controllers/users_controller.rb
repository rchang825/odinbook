class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @pending_follows = pending_follows
    @approved_follows = approved_follows
    @declined_follows = declined_follows
  end


  private
  def pending_follows
    current_user.fan_follows.where(approved: nil)
  end
  def approved_follows
    current_user.fan_follows.where(approved: true)
  end
  def declined_follows
    current_user.fan_follows.where(approved: false)
  end
end
