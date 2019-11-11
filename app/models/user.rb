class User < ApplicationRecord
  has_many :ships, dependent: :destroy, foreign_key: :owner_id # => OWNER
  has_many :bookings # => RENTER

  has_many :owner_bookings, through: :ships, source: :bookings # => OWNER
  # has_many :booked_ships, through: :bookings # => RENTER

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
