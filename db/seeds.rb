require_relative 'seeds_helper'

# destroy all instances
Booking.destroy_all
Van.destroy_all
User.destroy_all

# create random instances
create_users(10)
create_vans(30)
create_bookings # creates for each randomly generated user 1 booking

# create admin users (will be assigned later)
# admin as well as ourselves
puts "\n...create admin users!"
User.create!(first_name: "admin", last_name: "admin", password: "123456", email:"admin@admin.com", date_of_birth: Date.new(1990,5,1))
User.create!(first_name: "thomas", last_name: "thomas", password: "123456", email:"thomas@thomas.com", date_of_birth: Date.new(1991,3,2))
User.create!(first_name: "holmes", last_name: "holmes", password: "123456", email:"holmes@holmes.com", date_of_birth: Date.new(1990,2,5))
User.create!(first_name: "thilo", last_name: "thilo", password: "123456", email:"thilo@thilo.com", date_of_birth: Date.new(1993,6,2))
User.create!(first_name: "assunta", last_name: "assunta", password: "123456", email:"assunta@assunta.com", date_of_birth: Date.new(1995,6,9))
