class PagesController < ApplicationController
<<<<<<< HEAD
  # skip_before_action :authenticate_user!, only: :home
=======
   skip_before_action :authenticate_user!, only: :home
>>>>>>> cb7995e078f331dc6de83db4ada09ec130f7a6fc
  def home
    @ships = Ship.all
  end
end
