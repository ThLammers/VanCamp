class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :thomas]
  def home
    # @user = current_user
  end

  def thomas
    @users = User.all
    @vans = Van.all
    @bookings = Booking.all
  end
end
