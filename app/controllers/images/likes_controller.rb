class Images::LikesController < LikesController
  before_action :set_likeable

  private
  def set_likeable
    @likeable = Image.find(params[:image_id])
  end
end
