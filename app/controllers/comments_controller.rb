class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    puts @comment
    if @comment.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :body)
  end
end
