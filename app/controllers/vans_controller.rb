class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]

  def index
    if params[:commit] == "search"
      seats = search_params[:seats]
      location = search_params[:location]
      @vans = Van.where('location ILIKE :location AND seats >= :seats', location: @location, seats: seats)
    else
      @vans = Van.all
    end
  end

  def search
    # raise
  end

  private

  def search_params
    params.permit(:location, :seats)
  end
end
