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
      seats: rand(1..30),
      user: random_user,
    )
    print "*"
    print "\n" if (count + 1) % 10 == 0
  end
end

# HELPER METHODS TO PICK RANDOM INSTANCES
def random_user
  User.offset(rand(User.count)).first
end
def random_van
  Van.offset(rand(Van.count)).first
end

