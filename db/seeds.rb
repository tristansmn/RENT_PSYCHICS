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

Psychic.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Accessory.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?

accessories = %w(CrystalBall MagicTea Van Cat Ghost AK47 Cards OuijaBoard)
specialties = %w(blackMagic Voodoo KarmaBooster Visions Ghosts Tarot Divination AstralProjection EnergyMedicine)
addresses = [
  "20 rue de la pompe Paris",
  "2 avenue des champs elysees Paris",
  "Kensington Gardens, Kensington, London W8 4PX, Royaume-Uni",
  "Calle Irlanda, 2, 28019 Madrid, Espagne"
  ]

20.times do
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

accessories.each do |accessory|
  Accessory.create!(name: accessory, price: rand(5..200))
end
# il faudrait une table de jointure entre accessories et psychic

# pour booking l erreur pour rails:seed➜  RENT_PSYCHICS git:(master) rails db:seed
# rails aborted!
# ArgumentError: You need to supply at least one validation
# /Users/antoine/code/TRISTAN/RENT_PSYCHICS/app/models/booking.rb:6:in `<class:Booking>'
# /Users/antoine/code/TRISTAN/RENT_PSYCHICS/app/models/booking.rb:1:in `<main>'
# /Users/antoine/code/TRISTAN/RENT_PSYCHICS/db/seeds.rb:16:in `<main>'
# /Users/antoine/code/TRISTAN/RENT_PSYCHICS/bin/rails:9:in `<top (required)>'
# /Users/antoine/code/TRISTAN/RENT_PSYCHICS/bin/spring:15:in `<top (required)>'
# ./bin/rails:3:in `load'
# ./bin/rails:3:in `<main>'
# Tasks: TOP => db:seed
# (See full trace by running task with --trace)
