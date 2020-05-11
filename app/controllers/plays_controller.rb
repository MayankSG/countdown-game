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

  def create
    @play = Play.new(play_params)
    if @play.save
      render json: @play
    else
      render json: { error: 'something went wrong...' }
    end
  end

  def game
    images = PlayImage.get_image_attachments
                      .flatten
                      .collect { |record| url_for(record) }
    @images = images.shuffle.sample(rand(5..10))
    @plays = Play.all
  end

  private

  def play_image_params
    params.require(:play_image).permit(images: [])
  end

  def play_params
    params.require(:play).permit(:time_count, :image_url)
  end
end
