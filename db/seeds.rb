require 'faker'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all instances"
Booking.destroy_all if Rails.env.development?
Ship.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

status = ["pending", "confirmed", "canceled"]

puts "Create users"

# DAPHNEE
daph_url_avatar = "https://res.cloudinary.com/yannr/image/upload/v1573647304/IMG_7636_tc5qig.jpg"
daph = User.new(bio: "Prime Hunter", email: "daph@example.com", password: "password", first_name: "Daphnée", last_name: "Duportal")
daph.remote_avatar_url = daph_url_avatar
daph.save!

# JOHNNY
johnny_url_avatar = "https://res.cloudinary.com/yannr/image/upload/v1573593123/vrcdelh5kzrwxo0akanm.jpg"
johnny = User.new(bio: "Space Pirate", email: "johnny@example.com", password: "password", first_name: "Johnny", last_name: "Girault")
johnny.remote_avatar_url = johnny_url_avatar
johnny.save!

# YANN
yann_url_avatar = "https://res.cloudinary.com/yannr/image/upload/v1573648503/yann4_cz39zi.jpg"
yann = User.new(bio: "Cyborg from Greygen Corporation",email: "yann@example.com", password: "password", first_name: "Yann", last_name: "Ropert")
yann.remote_avatar_url = yann_url_avatar
yann.save!

# DOUG
doug_url_avatar = "https://res.cloudinary.com/yannr/image/upload/v1573734553/doug_jm4fdl.png"
doug = User.new(bio: "Illegal immigrant from the USA galaxy",email: "doug@example.com", password: "password", first_name: "Doug", last_name: "Delpha")
doug.remote_avatar_url = doug_url_avatar
doug.save!

puts "Create ships"

quad = Ship.new(model: "Quadjumper", price_per_day: 60, description: "Cargo with four engines", capacity_max: 6, address: "
21 Rue Pierre Gourdel, 35000 Rennes ")
quad.photo = File.open(Rails.root.join("db/fixtures/ships/Quadjumper-removebg-preview.png"))
quad.owner = daph
quad.save!

x_wing_2 = Ship.new(model: "X-Wing", capacity_max: 1, description: "Rebellion starfighter", price_per_day: 100, captain: true, address: "32 Rue de la Palestine, 35000 Rennes")
x_wing_2.photo = File.open(Rails.root.join("db/fixtures/ships/x-wing-removebg-preview.png"))
x_wing_2.owner = johnny
x_wing_2.save!

tie_bomb = Ship.new(model: "Tie Bomber", capacity_max: 1, description: "Bombing variant of the TIE line used by the Galactic Empire", price_per_day: 120, captain: true, address: "16 Boulevard Charles Péguy, 35700 Rennes")
tie_bomb.owner = yann
tie_bomb.photo = File.open(Rails.root.join("db/fixtures/ships/tie-bomber-removebg-preview.png"))
tie_bomb.save!

t_47 = Ship.new(model: "T-47 Snowspeeder", capacity_max: 2, description: "Le T-47 Airspeeder, était originellement un petit speeder civil construit par Incom Corporation, mais l’Alliance Reebelle en acquit un certain nombre et les modifia grandement.", price_per_day: 160, captain: true, address: "53 Rue le Guen de Kerangal, 35200 Rennes")
t_47.owner = yann
t_47.photo = File.open(Rails.root.join("db/fixtures/ships/T-47_Speeder-removebg-preview.png"))
t_47.save!

puts "Create bookings"

Booking.create!(
  captain: true,
  start_date: Date.today,
  end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  status: status.sample,
  total_price: rand(20..200),
  ship: t_47,
  number_of_guests: rand(1..5),
  user: doug
)

Booking.create!(
  captain: false,
  start_date: Date.today,
  end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
  status: status.sample,
  total_price: rand(20..200),
  ship: x_wing_2,
  number_of_guests: rand(1..3),
  user: daph
)

puts "Done !"

# url_ship = "https://res.cloudinary.com/yannr/image/upload/v1573553018/x-wing_rrx1sl.png"
# url_avatar = "https://res.cloudinary.com/yannr/image/upload/v1573553210/darth_vader_mjxmvx.png"
# 5.times do
#  user = User.new(
#    first_name: Faker::Name.unique.first_name,
#    last_name: Faker::Name.unique.last_name,
#    email: Faker::Internet.email,
#    password: Faker::Internet.password,
#    bio: Faker::Lorem.paragraph,
#    )
#  user.remote_avatar_url = url_avatar
#  user.save!
# end

# 5.times do
#  ship = Ship.new(
#    model: Faker::Vehicle.model,
#    capacity_max: rand(1..5),
#    address: Faker::Address.state,
#    description: Faker::Lorem.paragraph,
#    captain: true,
#    price_per_day: Faker::Number.between(from: 20, to: 200),
#    owner: User.all.sample
#    )
#  ship.remote_photo_url = url_ship
#  ship.save!
# end

