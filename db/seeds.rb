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
  "20 rue de la pompe Paris",
  "2 avenue des champs elysees Paris",
  "Kensington Gardens London ",
  "Calle Irlanda 28019 Madrid"
  ]
puts "création des seeds user et psychic"
puts "------------------------------------"

antoine = User.create(
    name: "Antoine",
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
    name: "Gérard",
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )

puts "Creating psychic profiles"
puts "------------------------------------"

file = URI.open('https://res.cloudinary.com/antoine83/image/upload/v1605867886/4alku05tg0no68ce7kqx74rn5ax5.jpg')
genius = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: antoine.id})
genius.user = antoine
genius.photo.attach(io: file, filename: '#{genius.user.name}.jpg', content_type: 'image/jpg')
genius.save!

file = URI.open('https://res.cloudinary.com/antoine83/image/upload/v1605870978/psychic_of0o8v.jpg')
whoopy = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: manon.id})
whoopy.user = manon
whoopy.photo.attach(io: file, filename: '#{whoopy.user.name}.jpg', content_type: 'image/jpg')
whoopy.save!

file = URI.open('https://res.cloudinary.com/antoine83/image/upload/v1605871005/photo-1600637453426-7c64826b19d9_o7o5nr.jpg')
wizzard = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: tristan.id})
wizzard.user = tristan
wizzard.photo.attach(io: file, filename: '#{wizzard.user.name}.jpg', content_type: 'image/jpg')
wizzard.save!

file = URI.open('https://res.cloudinary.com/antoine83/image/upload/v1605870930/photo-1582744709859-2d89c6920cfb_vttgrm.jpg')
cards = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: michel.id})
cards.user = michel
cards.photo.attach(io: file, filename: '#{cards.user.name}.jpg', content_type: 'image/jpg')
cards.save!

file = URI.open('https://res.cloudinary.com/antoine83/image/upload/v1605870912/photo-1592215955539-f020e64a7125_niq7zc.jpg')
zoltar = Psychic.new({localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: gege.id})
zoltar.user = gege
zoltar.photo.attach(io: file, filename: '#{zoltar.user.name}.jpg', content_type: 'image/jpg')
zoltar.save!



6.times do
  User.create(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "testpassword"
    # devise sait que "password" est à encrypter, donc pour tester on peut mettre password: (et ce sera "testpassword" le set up)
    )
  if User.last.id.even?
    Psychic.create(
      localisation: addresses.sample,
      hour_rate: [45 , 50, 55, 60, 70, 80, 2500].sample,
      specialty: specialties[rand(0..(specialties.length - 1))],
      user_id: User.last.id
      )
  end
end

puts "création des seeds accessoires"
puts "------------------------------------"

accessories.each do |accessory|
  Accessory.create!(name: accessory, price: rand(5..200))
end
# il faudrait une table de jointure entre accessories et psychic
