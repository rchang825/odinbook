class FollowsController < ApplicationController
  def create
    @user = current_user
    @followee = User.find(params[:user_id])
    @follow = @user.idol_follows.create(follower_id: @user.id, followee_id: @followee.id)
    @follow.save

  end
  def show
    @follow = Follow.find(params[:id])
  end
  def approve
    #find current follow
    #update follow to approved = T
    #save follow
    #turboframe??
    @follow = Follow.find(params[:id])
    @follow.update(approved: true)
    if @follow.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def decline
    @follow = Follow.find(params[:id])
    @follow.update(approved: false)
    if @follow.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
