class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.string :end_date
      t.integer :number_of_guests
      t.boolean :captain
      t.float :total_price
      t.string :status
      t.references :ship, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
