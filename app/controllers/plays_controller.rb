class PlaysController < ApplicationController
  def home
    @images = PlayImage.new
  end

  def store_images
    @images = PlayImage.new(play_image_params)
    if @images.save
      redirect_to plays_home_path
    else
      render 'home'
    end
  end

  private

  def play_image_params
    params.require(:play_image).permit(images: [])
  end
end
