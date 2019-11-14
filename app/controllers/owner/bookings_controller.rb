class Owner::BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline]

  def index
    @bookings = Booking.joins(:ship).where(ships: { owner: current_user })
  end

  def accept
    @booking.status = "confirmed"
    @booking.save
    redirect_to owner_bookings_path
  end

  def decline
    @booking.status = "canceled"
    @booking.save
    redirect_to owner_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  # def booking_params
  #   params.require(:booking).permit(:start_date, :end_date, :number_of_guests, :captain)
  # end
end

