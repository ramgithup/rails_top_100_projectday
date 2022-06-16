class Api::ArtistsController < ApplicationController
  before_action :set_artists, only: [:show, :update, :delete]
  def index
    render json: @billboard.artists
  end

  def show
    render json: @artists
  end

  def create
    @artists = @billboard.artists.new(artists_params)
    if @artists.save
      render json: @artists
    else
     render json: {errors: @artists.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @artists.update(artists_params)
      render json: @artists
    else
      render json: { errors: @artists.errors }, status: :unprocessable_entity
    end
  end

  def delete
    @artists.destroy
    render json: { message: 'artists Deleted' }
  end
  private
  def artists_params
    params.require(:artists).permit(:name, :album :songs)
  end
  def set_artists
    @artists = Artists.find(params[:id])
  end
end

