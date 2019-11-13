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

#DAPHNEE
daph = User.new(avatar: "https://res.cloudinary.com/yannr/image/upload/v1573647304/IMG_7636_tc5qig.jpg", bio: "daph", email: "daph@example.com", password: "password", first_name: "Daphnée", last_name: "Duportal")
daph.save!

quad = Ship.new(model: "Pod-Racer", price_per_day: 60, capacity_max: 1, address: "Chez Daphnée, Caen")
quad.photo = File.open(Rails.root.join("db/fixtures/ships/Quadjumper.png"))
quad.owner = daph
quad.save!

#JOHNNY
johnny = User.new(avatar: "https://res.cloudinary.com/yannr/image/upload/v1573593123/vrcdelh5kzrwxo0akanm.jpg", bio: "johnny", email: "johnny@example.com", password: "password", first_name: "Johnny", last_name: "Girault")
johnny.save!


x_wing_2 = Ship.new(model: "X-Wing", capacity_max: 1, description: "Rebellion starfighter", price_per_day: 100, captain: true, address: "Lannion, France")
x_wing_2.photo = File.open(Rails.root.join("db/fixtures/ships/x-wing.png"))
x_wing_2.owner = johnny
x_wing_2.save!

#YANN
yann = User.new(avatar: "https://res.cloudinary.com/yannr/image/upload/v1573648503/yann4_cz39zi.jpg", bio: "yann",email: "yann@example.com", password: "password", first_name: "Yann", last_name: "Ropert")
yann.save!

tie_bomb = Ship.new(model: "Tie Bomber", capacity_max: 1, description: "Bombing variant of the TIE line used by the Galactic Empire", price_per_day: 120, captain: true, address: "Brest, France")
tie_bomb.owner = yann
tie_bomb.photo = File.open(Rails.root.join("db/fixtures/ships/tie-bomber.jpg"))
tie_bomb.save!

puts "Create users"
5.times do
 user = User.new(
   first_name: Faker::Name.unique.first_name,
   last_name: Faker::Name.unique.last_name,
   email: Faker::Internet.email,
   password: Faker::Internet.password,
   bio: Faker::Lorem.paragraph,
   )
 user.remote_avatar_url = url_avatar
 user.save!
end

puts "Create ships"
5.times do
 ship = Ship.new(
   model: Faker::Vehicle.model,
   capacity_max: rand(1..5),
   address: Faker::Address.state,
   description: Faker::Lorem.paragraph,
   captain: true,
   price_per_day: Faker::Number.between(from: 20, to: 200),
   owner: User.all.sample
   )
 ship.remote_photo_url = url_ship
 ship.save!
end

puts "Create bookings"
5.times do
 Booking.create!(
   start_date: Date.today,
   end_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
   status: status.sample,
   total_price: Faker::Number.between(from: 20, to: 200),
   ship: Ship.all.sample,
   number_of_guests: rand(1..5),
   user: User.all.sample
   )
end

puts "Done !"
