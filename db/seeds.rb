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

#DAPHNEE
daph = User.new(email: "daph@example.com", password: "password", first_name: "Daphnée", last_name: "Duportal")
daph.save!

pod = Ship.new(model: "Pod-Racer", price_per_day: 60, capacity_max: 1, address: "Chez Daphnée, Caen")
pod.owner = daph
pod.save!

#JOHNNY
johnny = User.new(email: "johnny@example.com", password: "password", first_name: "Johnny", last_name: "Girault")
johnny.save!

x_wing_2 = Ship.new(model: "X-Wing", capacity_max: 1, description: "Rebellion starfighter", price_per_day: 100, captain: true, address: "Lannion, France")
x_wing_2.owner = johnny
x_wing_2.save!

#YANN
yann = User.new(email: "yann@example.com", password: "password", first_name: "Yann", last_name: "Ropert")
yann.save!

tie_bomb = Ship.new(model: "Tie Bomber", capacity_max: 1, description: "Bombing variant of the TIE line used by the Galactic Empire", price_per_day: 120, captain: true, address: "Brest, France")
tie_bomb.owner = yann
tie_bomb.save!


status = ["pending", "confirmed", "canceled"]
url_ship = "https://res.cloudinary.com/yannr/image/upload/v1573553018/x-wing_rrx1sl.png"
url_avatar = "https://res.cloudinary.com/yannr/image/upload/v1573553210/darth_vader_mjxmvx.png"


puts "Create users"
20.times do
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
20.times do
 ship = Ship.new(
   model: Faker::Vehicle.model,
   capacity_max: rand(1..5),
   address: Faker::Address.street_address,
   description: Faker::Lorem.paragraph,
   captain: true,
   price_per_day: Faker::Number.between(from: 20, to: 200),
   owner: User.all.sample
   )
 ship.remote_photo_url = url_ship
 ship.save!
end

puts "Create bookings"
20.times do
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
