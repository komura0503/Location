class MapsController < ApplicationController

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    @map.post_id = current_user.id
    @map.save
    redirect_to maps_path(@map)
  end

  def index
    @maps = Map.all
  end

  private

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude)
  end
end
