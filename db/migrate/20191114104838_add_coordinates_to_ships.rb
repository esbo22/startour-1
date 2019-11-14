class AddCoordinatesToShips < ActiveRecord::Migration[5.2]
  def change
    add_column :ships, :latitude, :float
    add_column :ships, :longitude, :float
  end
end
