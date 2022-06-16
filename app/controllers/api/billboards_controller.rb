class Api::BillboardsController < ApplicationController
  
  before_action :set_billboard, only: [:show, :update, :delete]
  def index
    @billboard = Billboard.all
    render json: @billboard
  end

  def show
    render json: @billboard
  end

  def new 
    @billboard = Billboard.new
    if @billboard.save
      render json: @billboard
    else
     render json: {errors: @billboard.errors}, status: :unprocessable_entity
    end
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save 
      render json: @billboard 
    else
      render json: { errors: @billboard.errors }, status: :unprocessable_entity
    end

  end

  def update
    if @billboard.update(billboard_params)
      render json: @list
    else
      render json: { errors: @list.errors }, status: :unprocessable_entity
    end
  end

  def delete
    @billbpard.destroy
    render json: { message: 'billbpard Deleted' }
  end
  private
  def billboard_params
    params.require(:billboard).permit(:genre, :topArtist :picture)
  end
  def set_billboard
    @list = List.find(params[:id])
  end
end
