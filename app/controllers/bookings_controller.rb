class BookingsController < ApplicationController
  def new
    @ship = Ship.find(params[:ship_id])
    @booking = Booking.new
  end

  def create
    @ship = Ship.find(params[:ship_id])
    @booking = Booking.new(booking_params)
    @booking.ship = @ship
    @booking.user = current_user
    @booking.set_total_price!

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guests, :captain, :avatar)
  end
end
