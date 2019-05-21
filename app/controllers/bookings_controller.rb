class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    # As a user, I can see all my booked vans
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
  end

  def show
    authorize @booking
    # As a user, I can see the details of one of my bookings
  end

  def new
    # As a user, I can book a van
    @booking = Booking.new
    @booking.user_id = current_user.id
    @booking.van_id = booking_params[:van_id]
    authorize @booking
  end

  def create
    new
    if @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to user_bookings_path(current_user)
  end

  private

  def booking_params
    params.permit(:user_id, :van_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
