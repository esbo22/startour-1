class Booking < ApplicationRecord
  belongs_to :ship
  belongs_to :user

  def set_total_price!
    self.total_price = (end_date - start_date).to_f * ship.price_per_day
    self.total_price += 50.0 if captain?
  end

  validates :status, presence: true, inclusion: { in: ["pending", "confirmed", "canceled"], allow_nil: false }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :number_of_guests, presence: true
end
