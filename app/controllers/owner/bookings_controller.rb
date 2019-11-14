class Owner::BookingsController < ApplicationController
  def index
    @bookings = Booking.joins(:ship).where(ships: { owner: current_user })
  end

  def accept
    @booking = Booking.new
    @booking.status = "confirmed"
    @booking.save
    redirect_to owner_ships_path
  end

  def decline
    @booking = Booking.new
    @booking.status = "canceled"
    @booking.save
    redirect_to owner_ships_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  # def booking_params
  #   params.require(:booking).permit(:start_date, :end_date, :number_of_guests, :captain)
  # end
end

