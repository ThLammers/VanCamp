require_relative 'seeds_helper'

# destroy all instances
Van.destroy_all
User.destroy_all

# create random instances
create_users(10)
create_vans(100)

