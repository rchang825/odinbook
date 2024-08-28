class PostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to "/posts"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def post_params
    params.require(:post).permit(:content)
  end
end
