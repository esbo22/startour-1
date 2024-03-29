# frozen_string_literal: true

class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @ships = Ship.where.not(owner: current_user)
  end

  def show
    @booking = Booking.new
    @bookings = @ship.bookings
    @ship = Ship.find(params[:id])
    @alert_message = "You are viewing the ship of #{@ship.owner.first_name}"

    @markers = [{
      lat: @ship.latitude,
      lng: @ship.longitude
    }]
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.owner = current_user
    if @ship.save
      redirect_to ship_path(@ship)
    else
      render :new
    end
  end

  def edit
  end

  private

  def ship_params
    params.require(:ship).permit(:captain, :address, :model, :photo, :price_per_day, :description, :photo, :capacity_max)
  end

  def set_ship
    @ship = Ship.find(params[:id])
  end
end
