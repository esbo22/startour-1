class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :model
      t.integer :capacity_max
      t.text :description
      t.float :price_per_day
      t.boolean :captain
      t.string :photo
      t.string :address

      t.timestamps
    end
  end
end
