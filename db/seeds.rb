require_relative 'seeds_helper'

# destroy all instances
Booking.destroy_all
Van.destroy_all
User.destroy_all

# create testuser (will be our admin later)
User.create!(first_name: "admin", last_name: "admin", password: "123456", email:"admin@admin.com", date_of_birth: Date.new(1990,5,1))

# create random instances
create_users(10)
create_vans(100)
create_bookings # creates for each user 1 booking
