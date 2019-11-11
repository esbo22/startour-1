class AddReferencesToShips < ActiveRecord::Migration[5.2]
  def change
    add_reference :ships, :owner, foreign_key: { to_table: :users }
  end
end
