class VansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_van, only: [:show, :edit, :update, :destroy]

  def index
    if params[:location]
      @seats = search_params[:seats]&.to_i
      @location = search_params[:location]
      # .where("location ILIKE ? AND seats >= ?", "%#{@location}%", @seats)
      @vans = policy_scope(Van).near(@location, 100).where.not(latitude: nil, longitude: nil)
    else
      @vans = policy_scope(Van).all
    end
    @markers = @vans.map do |van|
      {
        lat: van.latitude,
        lng: van.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { van: van })
      }
    end
  end

  def show
    authorize @van
    # TO DISCUSS: we need an empty bookings instance for the vans show page
    # to be ready in case a modal is triggered. It seems messy to me, normally
    # this is a task that the bookings controller should do, isn't it? :P (thomas)
    @booking = Booking.new
    @booking.user = current_user
    @booking.van = @van
    authorize @booking
    @review = Review.new
  end

  def new
    @van = Van.new
    authorize @van
  end

  def create
    @van = Van.new(van_params)
    @van.price_per_day = van_params[:price_per_day]&.to_i unless van_params[:price_per_day].empty?
    @van.user = current_user
    authorize @van
    if @van.save
      redirect_to @van
    else
      redirect_to root_path
    end
  end

  def edit
    authorize @van
  end

  def update
    authorize @van
    @van.update(van_params)
    redirect_to @van
  end

  def destroy
    authorize @van
    @van.destroy
    redirect_to vans_path
  end

  private

  def van_params
    params.require(:van).permit(:location, :title, :description, :seats, :brand, :category, :price_per_day, :photo)
  end

  def search_params
    params.permit(:location, :seats)
  end

  def set_van
    @van = Van.find(params[:id])
  end
end
