# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @ship = Ship.find(params[:ship_id])
    @booking = Booking.new
  end

  def create
    @ship = Ship.find(params[:ship_id])
    @booking = Booking.new(booking_params)
    @booking.ship = @ship
    @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @ship.price_per_day
    @booking.user = current_user
    if @booking.save
      redirect_to ship_path(@ship)
    else
      render :new
    end
  end

  def index

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_guests, :captain)
  end
end
