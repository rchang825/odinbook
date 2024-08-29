class FollowsController < ApplicationController
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
