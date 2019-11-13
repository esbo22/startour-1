class Owner::ShipsController < ApplicationController
  def index
    @ships = current_user.ships
  end
end
