class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  before_action :set_van, only: [:show, :edit, :update, :destroy]

  def index
    if params[:commit] == "search"
      seats = search_params[:seats].to_i
      @location = search_params[:location]
      @vans = policy_scope(Van).where('location ILIKE :location AND seats >= :seats', location: @location, seats: seats)
    else
      @vans = policy_scope(Van).all
    end
  end

  def search
    # raise
  end

  def show
    authorize @van
  end

  def new
    authorize @van
    @van = Van.new
  end

  def create
    authorize @van
    @van = Van.new(van_params)
    @van.price_per_day = van_params[:price_per_day].to_i
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
    params.require(:van).permit(:location, :title, :description, :seats, :brand, :category, :price_per_day)
  end

  def search_params
    params.permit(:location, :seats)
  end

  def set_van
    @van = Van.find(params[:id])
  end
end
