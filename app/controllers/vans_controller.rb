class VansController < ApplicationController
  before_action :set_van, only: [:show, :edit, :update, :destroy]

  def index
    if params[:location] || params[:seats]
      seats = search_params[:seats].to_i
      @location = search_params[:location]
      @vans = Van.where('location ILIKE :location AND seats >= :seats', location: @location, seats: seats)
    else
      @vans = Van.all
    end
  end

  def show
  end

  def new
    @van = Van.new
  end

  def create
    @van = Van.new(van_params)
    @van.user = current_user
    if @van.save
      redirect_to @van
    else
      render :new
    end
  end

  def edit
  end

  def update
    @van.update(van_params)
    redirect_to @van
  end

  def destroy
    @van.destroy
    redirect_to vans_path
  end

  private

  def van_params
    params.require(:van).permit(:location, :title, :description, :seats, :brand, :category, :location)
  end

  def search_params
    params.permit(:location, :seats)
  end

  def set_van
    @van = Van.find(params[:id])
  end
end
