# THIS IS NOT REALLY A SEED FILE
# it has to be done only once! All the urls are uploaded to cludinary and
# we get back a new url (hosted by cloudinary)! Then we can use this new
# URL to assign to the variable Van.photo (via v.photo)
# DOES NOT WORK YET...

images = [
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

# NOT WORKING...
# results = [];
# images.each do |image_url|
#   v = Van.new
#   v.remote_photo_url = image_url
#   results << v.photo.url
# end

