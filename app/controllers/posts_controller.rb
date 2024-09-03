class PostsController < ApplicationController
  def index
    user = current_user
    #find idols with follower_id == current_user.id AND approved = true
    feed_users = user.idol_follows.where(approved: true).pluck(:followee_id)
    feed_users.push(user.id)
    @posts = Post.where(user_id: feed_users)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
end
