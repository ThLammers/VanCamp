class VansController < ApplicationController

  def search
    raise
    if params
      @vans = Van.where(location: params[:location] && :seats >= params[:seats])
    else
    end
  end

  private

  def search_params
    params.permit(:location, :seats)
  end
end
