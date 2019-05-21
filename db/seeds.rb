Van.destroy_all

100.times do
  Van.create!(
    title: Faker::FunnyName.name,
    description: 'the best van ever',
    location: ['Berlin', 'London', 'Toronto', 'Paris', 'Tokyo'].sample,
    brand: ['Volvo', 'Mercedes', 'Ferrari', 'Maserati'].sample,
    category: ['family trip', 'road trip', 'luxury camping'].sample,
    seats: rand(1..30),
    user_id: rand(1..3),
    )
end
