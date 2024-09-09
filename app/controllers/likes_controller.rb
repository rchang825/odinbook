class LikesController < ApplicationController
  def create
    if !liked?
      @like = @likeable.likes.new(user_id: current_user.id)
      @like.user = current_user
      @like.save
    end
  end

  private
  def liked?
    @likeable.likes.where(user_id: current_user.id).exists?
  end
end
