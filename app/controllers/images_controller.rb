class ImagesController < ApplicationController
  def index
    user = current_user
    feed_users = user.idol_follows.where(approved: true).pluck(:followee_id)
    @images = Image.where(user_id: feed_users)
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if @image.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  end


  private
  def image_params
    params.require(:image).permit(:content, :caption)
  end
end
