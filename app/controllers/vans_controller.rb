class VansController < ApplicationController

  def index
    if params[:location] || params[:seats]
      seats = search_params[:seats]
      location = search_params[:location]
      @vans = Van.where(location: location && :seats >= seats)
    else
      @vans = Van.all
    end
  end

  private

  def search_params
    params.permit(:location, :seats)
  end
end
