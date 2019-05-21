# creates n random users and saves them in the db
def create_users(n)
  puts "creating #{n} random users!"
  n.times do |count|
    full = Faker::Name.name
    User.create!(
      first_name: full.split[0],
      last_name: full.split[1],
      email: Faker::Internet.email,
      password: Faker::Internet.password(6, 12),
      date_of_birth: Faker::Date.birthday(18, 65)
    )
    print "*"
    print "\n" if (count + 1) % 10 == 0
  end
end

# creates n random vans and saves them in the db
def create_vans(n)
  puts "creating #{n} random vans!"
  n.times do |count|
    Van.create!(
      title: Faker::FunnyName.name,
      description: 'the best van ever',
      location: ['Berlin', 'London', 'Toronto', 'Paris', 'Tokyo'].sample,
      brand: ['Volvo', 'Mercedes', 'Ferrari', 'Maserati'].sample,
      category: ['family trip', 'road trip', 'luxury camping'].sample,
      price_per_day: [50,25,120,350].sample,
      seats: [[1,2,3,4]*2,[6]*4,[8]*4,[12]*4].flatten.sample,
      user: random_user,
    )
    print "*"
    print "\n" if (count + 1) % 10 == 0
  end
end

def create_bookings
  User.all.each do |user|
    puts "...creating booking for #{user.first_name} #{user.last_name}!"
    checkin = Faker::Date.between(1.month.from_now, 4.month.from_now)
    Booking.create!(
      user: user,
      van: random_van,
      checkin: checkin,
      checkout: checkin + (5..21).to_a.sample # trip between 5 and 21 days long
    )
  end
end

# HELPER METHODS TO PICK RANDOM INSTANCES
def random_user
  User.offset(rand(User.count)).first
end
def random_van
  Van.offset(rand(Van.count)).first
end

