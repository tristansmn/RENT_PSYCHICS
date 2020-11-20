# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# gem faker à installer
# migration à faire car j'ai pas lié de base les accessoires à un psychic

require 'faker'
require 'uri'

Psychic.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Accessory.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?

accessories = %w(CrystalBall MagicTea Van Cat Ghost AK47 Cards OuijaBoard)
specialties = %w(blackMagic Voodoo KarmaBooster Visions Ghosts Tarot Divination AstralProjection EnergyMedicine)
addresses = [
  "20, Rue de la Pompe Paris",
  "2, Avenue des Champs Elysees Paris",
  "Kensington Gardens, London ",
  "Calle Irlanda 28019 Madrid"
  ]
puts "création des seeds user et psychic"
puts "------------------------------------"

antoine = User.create(
    name: "Antoinette",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

manon = User.create(
    name: "Manon",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

tristan = User.create(
    name: "Tristan",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

michel = User.create(
    name: "Michel",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

gege = User.create(
    name: "Gerard",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

dany = User.create(
    name: "Dany",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

sam = User.create(
    name: "Sam",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

lee = User.create(
    name: "Lee",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

alex = User.create(
    name: "Alex",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )
jessy = User.create(
    name: "Jessy",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

puts "Creating psychic profiles"
puts "------------------------------------"

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605882430/photo-1543430720-fa600c67e423_gc7693.jpg')
genius = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: antoine.id})
genius.user = antoine
genius.photo.attach(io: file, filename: '#{genius.user.name}.jpg', content_type: 'image/jpg')
genius.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605880828/khrjhhhwn7zggw88x5w0yw1v38qa.jpg')
whoopy = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: manon.id})
whoopy.user = manon
whoopy.photo.attach(io: file, filename: '#{whoopy.user.name}.jpg', content_type: 'image/jpg')
whoopy.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605880848/4j8sm3j8jm86lpefjo29km1eisha.jpg')
wizzard = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: tristan.id})
wizzard.user = tristan
wizzard.photo.attach(io: file, filename: '#{wizzard.user.name}.jpg', content_type: 'image/jpg')
wizzard.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605880821/frz4r9gsb9vlvciwqyvd6ebhsaz6.jpg')
cards = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: michel.id})
cards.user = michel
cards.photo.attach(io: file, filename: '#{cards.user.name}.jpg', content_type: 'image/jpg')
cards.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605880836/cia9vv9ho5keukbr1ojtxwlssu14.jpg')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: gege.id})
zoltar.user = gege
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!

file = URI.open('https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: dany.id})
zoltar.user = dany
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605882705/photo-1519975258993-60b42d1c2ee2_ckhq3o.jpg')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: sam.id})
zoltar.user = sam
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605881136/k156f4iejh27bysq5vh4rloe7fyh.jpg')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: lee.id})
zoltar.user = lee
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605881809/d0a9cv3qecviin4hqiv5pu7337h1.jpg')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: alex.id})
zoltar.user = alex
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!

file = URI.open('https://res.cloudinary.com/du9wezv2c/image/upload/v1605881141/akjwpgvedn3tnu7ng36826pg3w9h.jpg')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: jessy.id})
zoltar.user = jessy
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!



# 6.times do
#   User.create(
#     name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "testpassword"
#     # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
#     )
#   if User.last.id.even?
#     Psychic.create(
#       localisation: addresses.sample,
#       hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
#       specialty: specialties[rand(0..(specialties.length - 1))],
#       user_id: User.last.id
#       )
#   end
# end

puts "création des seeds accessoires"
puts "------------------------------------"

accessories.each do |accessory|
  Accessory.create!(name: accessory, price: rand(5..200))
end
# il faudrait une table de jointure entre accessories et psychic
