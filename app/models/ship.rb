class Ship < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy

  validates :model, presence: true
  validates :address, presence: true
  # validates :photo, presence: true
  validates :price_per_day, presence: true
  validates :capacity_max, presence: true
end
