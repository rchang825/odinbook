class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
