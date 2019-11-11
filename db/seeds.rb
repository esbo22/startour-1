# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ship.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

#DAPHNEE
daph = User.new(email: "daph@example.com", password: "password", first_name: "Daphnée", last_name: "Duportal")
daph.save
pod = Ship.new(model: "Pod-Racer", price_per_day: 60, capacity_max: 1, address: "Chez Daphnée, Caen")
pod.owner = daph
pod.save

#JOHNNY
johnny = User.new(email: "johnny@example.com", password: "password", first_name: "Johnny", last_name: "Girault")
johnny.save
x_wing_2 = Ship.new(model: "X-Wing", capacity_max: 1, description: "Rebellion starfighter", price_per_day: 100, captain: true, address: "Lannion, France")
x_wing_2.owner = johnny
x_wing_2.save

#YANN
yann = User.new(email: "yann@example.com", password: "password", first_name: "Yann", last_name: "Ropert")
yann.save
tie_bomb = Ship.new(model: "Tie Bomber", capacity_max: 1, description: "Bombing variant of the TIE line used by the Galactic Empire", price_per_day: 120, captain: true, address: "Brest, France")
tie_bomb.owner = yann
tie_bomb.save
