class Api::SongsController < ApplicationController
  before_action :set_songs, only: [:show, :update, :delete]
  def index
    render json: @artists.songs
  end

  def show
    render json: @songs
  end

  def create
    @songs = @artists.songs.new(songs_params)
    if @songs.save
      render json: @songs
    else
     render json: {errors: @songs.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @songs.update(songs_params)
      render json: @songs
    else
      render json: { errors: @songs.errors }, status: :unprocessable_entity
    end
  end

  def delete
    @songs.destroy
    render json: { message: 'artists Deleted' }
  end
  private
  def songs_params
    params.require(:songs).permit(:name, :length)
  end
  def set_songs
    @songs = Songs.find(params[:id])
  end
end
