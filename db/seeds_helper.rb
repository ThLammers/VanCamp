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
    v = Van.new(
      title: Faker::FunnyName.name,
      description: 'the best van ever',
      location: ['Berlin', 'London', 'Toronto', 'Paris', 'Tokyo'].sample,
      brand: ['Volvo', 'Mercedes', 'Ferrari', 'Maserati'].sample,
      category: ['family trip', 'road trip', 'luxury camping'].sample,
      price_per_day: [50,25,120,350].sample,
      seats: [[1,2,3,4]*2,[6]*4,[8]*4,[12]*4].flatten.sample,
      user: random_user
      # photo: camper_van_photos.sample
    )
    v.remote_photo_url = camper_van_photos.sample
    v.save!
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

# camper random images
def camper_van_photos
  [
    "https://www.amlrv.com/wp-content/uploads/2012/10/2018-EC811-Ext-6.jpg",
    "https://scontent-amt2-1.cdninstagram.com/vp/d5ee32dd1e89963524672663fa90e72a/5D783902/t51.2885-15/sh0.08/e35/p640x640/59640896_455427868527181_6051845666360509035_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://i.pinimg.com/originals/44/8a/3c/448a3cc8d304c5d5902e9f4d90128c4b.jpg",
    "https://scontent-amt2-1.cdninstagram.com/vp/36c2799c50e88755b9594bd28f016db0/5D7E7A7C/t51.2885-15/sh0.08/e35/s640x640/61241254_2450815675141930_2807566144490276777_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://scontent-amt2-1.cdninstagram.com/vp/723f6cd1309b4d75cd42008a811be33a/5D9C818C/t51.2885-15/sh0.08/e35/p640x640/60579417_1342876585869931_5876995890130879655_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://scontent-amt2-1.cdninstagram.com/vp/369e67a15aa543a59308d6c9569435b2/5D7B05A4/t51.2885-15/sh0.08/e35/s640x640/59773633_109709226817373_5056732924526911329_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://scontent-amt2-1.cdninstagram.com/vp/8600849bed194d783058ec431b037789/5D6A25C2/t51.2885-15/sh0.08/e35/s640x640/60751587_606884439816364_1214416768983573286_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://i.pinimg.com/originals/44/8a/3c/448a3cc8d304c5d5902e9f4d90128c4b.jpg",
    "https://scontent-amt2-1.cdninstagram.com/vp/f2be291515a0b5b7a06fa2a34bc78ab5/5D969A5F/t51.2885-15/sh0.08/e35/s640x640/59655939_120569849147395_6150298372875730911_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://scontent-amt2-1.cdninstagram.com/vp/ab64a48f49142c9f6bf2f3aa6c2929fe/5D66C408/t51.2885-15/sh0.08/e35/s640x640/59768910_854720091545253_1877964677109302679_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://scontent-amt2-1.cdninstagram.com/vp/87affc45d406fe87e8e0e12f8fecf178/5D78CDE0/t51.2885-15/sh0.08/e35/s640x640/60890680_690390458063680_4815071206071252257_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://scontent-amt2-1.cdninstagram.com/vp/1dce0184978502cb7259131211e476a2/5D7A77C6/t51.2885-15/sh0.08/e35/s640x640/60133609_2366359880272047_5569725124295707006_n.jpg?_nc_ht=scontent-amt2-1.cdninstagram.com",
    "https://t-ec.bstatic.com/images/hotel/max1024x768/130/130381871.jpg",
    "https://t-ec.bstatic.com/images/hotel/max1024x768/129/129900055.jpg",
    "https://www.travellers-autobarn.com.au/wp-content/uploads/2013/03/Kuga-Hitop-Campervan-Lifestyle-153.jpg",
    "https://media-cdn.tripadvisor.com/media/vr-splice-j/06/ce/a2/70.jpg",
    "http://www.happylittlecamper.com/uploads/ItemManager/item/crop_large/camper7(1).jpg",
    "https://i.pinimg.com/originals/75/72/dc/7572dcbece4d08fed7db0e43611849a3.jpg",
    "https://mallorcalma.com/wp-content/uploads/2019/04/lazy.bus_.rental.vw_.mallorca-400x219.jpg",
    "https://www.bulliholiday.de/vw-bus-mieten/BulliHoliday-VW-Bus-mieten-Blumo-0.jpg",
    "https://mlj3wointmzz.i.optimole.com/w:auto/h:auto/q:auto/https://www.siestacampers.com/wp-content/uploads/2017/08/rio-beach-scene.jpg",
    "https://www.vwheritage.com/blog/wp-content/uploads/2016/04/Europe-Camper-Holiday-June-2013-281.jpg",
  ]
end
