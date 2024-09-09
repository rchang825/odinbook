class CommentsController < ApplicationController
  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    commentable_type = @comment.commentable_type
    if @comment.save
      if commentable_type == "Image"
        redirect_to images_path
      else
        redirect_to root_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
