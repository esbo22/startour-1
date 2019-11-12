# frozen_string_literal: true

class ShipsController < ApplicationController
  before_action :set_ship, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @ships = Ship.all
  end

  def show
    @booking = Booking.new
    @ship = Ship.find(params[:id])
    @bookings = @ship.bookings
    @alert_message = "You are viewing the ship of #{@ship.owner.first_name}"
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.user = current_user
    if @ship.save
      redirect_to_ship_path(@ship)
    else
      render :new
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:address, :model, :photo, :price_per_day, :description, :photo, :captain, :capacity_max, :breakfast)
  end

  def set_ship
    @ship = Ship.find(params[:id])
  end
end
