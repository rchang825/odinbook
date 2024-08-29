class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id) unless liked?
    redirect_to posts_path
  end

  private
  def liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
