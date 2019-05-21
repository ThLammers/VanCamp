class BookingsController < ApplicationController

  def index
    # As a user, I can see all my booked vans
    @bookings = Booking.where(user: current_user)
  end

  def show
    # As a user, I can see the details of one of my bookings
  end

  def new
    # As a user, I can book a van
  end

  def create
  end
end
