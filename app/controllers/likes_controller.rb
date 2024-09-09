class LikesController < ApplicationController
  def create
    if !liked?
      @like = @likeable.likes.new(user_id: current_user.id)
      @like.user = current_user
      likeable_type = @like.likeable_type
      if @like.save
        if likeable_type == "Image"
          @image = Image.find(@likeable.id)
          render partial: "images/image", locals: {image: @image}
        else
          @post = Post.find(@likeable.id)
          render partial: "posts/post", locals: {post: @post}
        end
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private
  def liked?
    @likeable.likes.where(user_id: current_user.id).exists?
  end
end
