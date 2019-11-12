class Booking < ApplicationRecord
  belongs_to :ship
  belongs_to :user

  validates :status, presence: true, inclusion: { in: ["pending", "confirmed", "canceled"], allow_nil: false }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :number_of_guests, presence: true
end
