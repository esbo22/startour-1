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
Booking.destroy_all
User.destroy_all
Ship.destroy_all

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
quad.photo = File.open(Rails.root.join("db/fixtures/ships/Quadjumper.jpeg"))
quad.owner = daph
quad.save!

x_wing_2 = Ship.new(model: "X-Wing", capacity_max: 1, description: "Rebellion starfighter", price_per_day: 100, captain: true, address: "32 Rue de la Palestine, 35000 Rennes")
x_wing_2.photo = File.open(Rails.root.join("db/fixtures/ships/x-wing.jpg"))
x_wing_2.owner = johnny
x_wing_2.save!

tie_bomb = Ship.new(model: "TIE Bomber", capacity_max: 1, description: "Bombing variant of the TIE line used by the Galactic Empire", price_per_day: 120, captain: true, address: "16 Boulevard Charles Péguy, 35700 Rennes")
tie_bomb.owner = yann
tie_bomb.photo = File.open(Rails.root.join("db/fixtures/ships/tie-bomber.png"))
tie_bomb.save!

t_47 = Ship.new(model: "T-47 Snowspeeder", capacity_max: 2, description: "Le T-47 Airspeeder, était originellement un petit speeder civil construit par Incom Corporation, mais l’Alliance Rebelle en acquit un certain nombre et les modifia grandement.", price_per_day: 160, captain: true, address: "53 Rue le Guen de Kerangal, 35200 Rennes")
t_47.owner = yann
t_47.photo = File.open(Rails.root.join("db/fixtures/ships/T-47_Speeder.png"))
t_47.save!

cr90 = Ship.new(model: "CR90", capacity_max: 30, description: "Construit par la Corporation Technique Corellienne, la Corvette CR-90 est à l'image des autres vaisseaux de la marque : rapide, bien armée, de conception robuste, et totalement modulaire.", price_per_day: 460, captain: true, address: "1 Rue de la 87ème Division ďInfanterie Territoriale, 35000 Rennes")
cr90.owner = doug
cr90.photo = File.open(Rails.root.join("db/fixtures/ships/cr90.jpg"))
cr90.save!

tie_fighter = Ship.new(model: "TIE Fighter", capacity_max: 1, description: "Propulsé par des moteurs à ions jumeaux et pouvant atteindre 1.600 km/h, le TIE Fighter v1 dispose de deux canons laser et d'un lance-missiles.", price_per_day: 60, captain: false, address: "3 Avenue Henri Fréville, 35200 Rennes")
tie_fighter.owner = yann
tie_fighter.photo = File.open(Rails.root.join("db/fixtures/ships/TieFighter.jpg"))
tie_fighter.save!

arc170 = Ship.new(captain: false, model: "ARC-170", price_per_day: 75, description: "L'ARC-170, ou officiellement Chasseur de Reconnaissance Agressif, est un appareil aux courbes bombées fabriqué par les industries Incom et Subpro pour le compte de la République durant la Guerre des Clones.", capacity_max: 3, address: "2 Allée de La Morinais, 35136 Saint-Jacques-de-la-Lande ")
arc170.photo = File.open(Rails.root.join("db/fixtures/ships/ARC170.jpg"))
arc170.owner = daph
arc170.save!

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
