class VansController < ApplicationController

  def index
    if params[:location] || params[:seats]
      seats = search_params[:seats].to_i
      location = search_params[:location]
      @vans = Van.where('location ILIKE :location AND seats >= :seats', location: location, seats: seats)
    else
      @vans = Van.all
    end
  end

  private

  def search_params
    params.permit(:location, :seats)
  end
end
