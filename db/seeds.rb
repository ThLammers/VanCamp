require_relative 'seeds_helper'

# destroy all instances
Booking.destroy_all
Van.destroy_all
User.destroy_all

# create random instances
create_users(10)
create_vans(100)
create_bookings # creates for each user 1 booking
